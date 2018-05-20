//
//  TwitterRequestSinging.m
//  TwitterEngine


#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>
#import <UIKit/UIKit.h>

NSString * fhs_url_remove_params(NSURL *url) {
    if (url.absoluteString.length == 0) {
        return nil;
    }
    
    NSArray *parts = [url.absoluteString componentsSeparatedByString:@"?"];
    return (parts.count == 0)?nil:parts[0];
}

@implementation NSString (FHSTwitterEngine)

- (NSString *)fhs_URLEncode {
    CFStringRef url = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, NULL, CFSTR("!*'();:@&=+$,/?%#[]"), kCFStringEncodingUTF8);
    return (__bridge NSString *)url;
}

+ (NSString *)fhs_UUID {
    if ([[[UIDevice currentDevice]systemVersion]floatValue] >= 6.0f) {
        return [[NSUUID UUID]UUIDString];
    } else {
        CFUUIDRef theUUID = CFUUIDCreate(kCFAllocatorDefault);
        CFStringRef string = CFUUIDCreateString(kCFAllocatorDefault, theUUID);
        CFRelease(theUUID);
        NSString *uuid = [NSString stringWithString:(__bridge NSString *)string];
        CFRelease(string);
        return uuid;
    }
}

@end
static char const Encode[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
@implementation NSData (FHSTwitterEngine)

- (NSString *)base64Encode {
    int outLength = ((((self.length*4)/3)/4)*4)+(((self.length*4)/3)%4?4:0);
    const char *inputBuffer = self.bytes;
    char *outputBuffer = malloc(outLength+1);
    outputBuffer[outLength] = 0;
    
    int cycle = 0;
    int inpos = 0;
    int outpos = 0;
    char temp = '\0';
    
    outputBuffer[outLength-1] = '=';
    outputBuffer[outLength-2] = '=';
    
    while (inpos < self.length) {
        switch (cycle) {
            case 0:
                outputBuffer[outpos++] = Encode[(inputBuffer[inpos]&0xFC)>>2];
                cycle = 1;
                break;
            case 1:
                temp = (inputBuffer[inpos++]&0x03)<<4;
                outputBuffer[outpos] = Encode[temp];
                cycle = 2;
                break;
            case 2:
                outputBuffer[outpos++] = Encode[temp|(inputBuffer[inpos]&0xF0)>>4];
                temp = (inputBuffer[inpos++]&0x0F)<<2;
                outputBuffer[outpos] = Encode[temp];
                cycle = 3;
                break;
            case 3:
                outputBuffer[outpos++] = Encode[temp|(inputBuffer[inpos]&0xC0)>>6];
                cycle = 4;
                break;
            case 4:
                outputBuffer[outpos++] = Encode[inputBuffer[inpos++]&0x3f];
                cycle = 0;
                break;
            default:
                cycle = 0;
                break;
        }
    }
    NSString *pictemp = [NSString stringWithUTF8String:outputBuffer];
    free(outputBuffer);
    return pictemp;
}

@end

#import "TwitterRequestSinging.h"

@implementation TwitterRequestSinging : NSObject 

+ (void)signRequest:(NSMutableURLRequest *)request withToken:(NSString *)tokenString tokenSecret:(NSString *)tokenSecretString verifier:(NSString *)verifierString key:(NSString *)key secret:(NSString *)theSecret {
    
    NSString *consumerKey = [key fhs_URLEncode];
    NSString *nonce = [NSString fhs_UUID];
    NSString *timestamp = [NSString stringWithFormat:@"%ld",time(nil)];
    NSString *urlWithoutParams = [fhs_url_remove_params(request.URL) fhs_URLEncode];
    
    // OAuth Spec, Section 9.1.1 "Normalize Request Parameters"
    // build a sorted array of both request parameters and OAuth header parameters
    NSMutableDictionary *mutableParams = [NSMutableDictionary dictionary];
    
    mutableParams[@"oauth_consumer_key"] = consumerKey;
    mutableParams[@"oauth_signature_method"] = @"HMAC-SHA1";
    mutableParams[@"oauth_timestamp"] = timestamp;
    mutableParams[@"oauth_nonce"] = nonce;
    mutableParams[@"oauth_version"] = @"1.0";
    
    if (tokenString.length > 0) {
        mutableParams[@"oauth_token"] = [tokenString fhs_URLEncode];
        if (verifierString.length > 0) {
            mutableParams[@"oauth_verifier"] = [verifierString fhs_URLEncode];
        }
    } else {
        mutableParams[@"oauth_callback"] = @"oob";
    }
    
    NSMutableArray *paramPairs = [NSMutableArray arrayWithCapacity:mutableParams.count];
    
    for (NSString *key in mutableParams.allKeys) {
        [paramPairs addObject:[NSString stringWithFormat:@"%@=%@",[key fhs_URLEncode],[mutableParams[key] fhs_URLEncode]]];
    }
    
    if ([request.HTTPMethod isEqualToString:@"GET"]) {
        
        NSArray *halves = [request.URL.absoluteString componentsSeparatedByString:@"?"];
        
        if (halves.count > 1) {
            NSArray *parameters = [halves[1] componentsSeparatedByString:@"&"];
            
            if (parameters.count > 0) {
                [paramPairs addObjectsFromArray:parameters];
            }
        }
    }
    
    [paramPairs sortUsingSelector:@selector(compare:)];
    
    NSString *normalizedRequestParameters = [[paramPairs componentsJoinedByString:@"&"]fhs_URLEncode];
    
    // OAuth Spec, Section 9.1.2 "Concatenate Request Elements"
    // Sign request elements using HMAC-SHA1
    NSString *signatureBaseString = [NSString stringWithFormat:@"%@&%@&%@",request.HTTPMethod,urlWithoutParams,normalizedRequestParameters];
    
    NSString *tokenSecretSantized = (tokenSecretString.length > 0)?[tokenSecretString fhs_URLEncode]:@""; // this way a nil token won't make a bad signature
    
    NSString *secret = [NSString stringWithFormat:@"%@&%@",[theSecret fhs_URLEncode],tokenSecretSantized];
    
    NSData *secretData = [secret dataUsingEncoding:NSUTF8StringEncoding];
    NSData *clearTextData = [signatureBaseString dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char result[20];
    CCHmac(kCCHmacAlgSHA1, secretData.bytes, secretData.length, clearTextData.bytes, clearTextData.length, result);
    NSData *theData = [[[NSData dataWithBytes:result length:20]base64Encode]dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *signature = [[[NSString alloc]initWithData:theData encoding:NSUTF8StringEncoding]fhs_URLEncode];
    
    NSString *oauthToken = (tokenString.length > 0)?[NSString stringWithFormat:@"oauth_token=\"%@\", ",[tokenString fhs_URLEncode]]:@"oauth_callback=\"oob\", ";
    NSString *oauthVerifier = (verifierString.length > 0)?[NSString stringWithFormat:@"oauth_verifier=\"%@\", ",verifierString]:@"";
    
    NSString *oauthHeader = [NSString stringWithFormat:@"OAuth oauth_consumer_key=\"%@\", %@%@oauth_signature_method=\"HMAC-SHA1\", oauth_signature=\"%@\", oauth_timestamp=\"%@\", oauth_nonce=\"%@\", oauth_version=\"1.0\"",consumerKey,oauthToken,oauthVerifier,signature,timestamp,nonce];
    
    [request setValue:oauthHeader forHTTPHeaderField:@"Authorization"];
}
@end
