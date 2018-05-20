//
//  ViewController.m
//  GCD的使用
//
//  Created by 郭丰锐 on 2018/4/25.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
        // Do any additional setup after loading the view, typically from a nib.
}


- (void)test{
    //DISPATCH_QUEUE_SERIAL串行
    //    dispatch_queue_create(@"com.gfr", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue= dispatch_queue_create("com.gfr", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i<10; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"%@",[NSThread currentThread]);
        });
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 __stubs:0000000102FFE310
 __stubs:0000000102FFE310
 __stubs:0000000102FFE310 ; DNSServiceErrorType __cdecl DNSServiceProcessResult(DNSServiceRef sdRef)
 __stubs:0000000102FFE310 _DNSServiceProcessResult                ; CODE XREF: __text:0000000100A03AE8↑p
 __stubs:0000000102FFE310                 ADRP            X16, #_DNSServiceProcessResult_ptr@PAGE
 __stubs:0000000102FFE314                 LDR             X16, [X16,#_DNSServiceProcessResult_ptr@PAGEOFF]
 __stubs:0000000102FFE318                 BR              X16
 __stubs:0000000102FFE318 ; End of function _DNSServiceProcessResult
 __stubs:0000000102FFE318
 __stubs:0000000102FFE31C
 __stubs:0000000102FFE31C ; =============== S U B R O U T I N E =======================================
 __stubs:0000000102FFE31C
 __stubs:0000000102FFE31C
 __stubs:0000000102FFE31C ; void __cdecl DNSServiceRefDeallocate(DNSServiceRef sdRef)
 __stubs:0000000102FFE31C _DNSServiceRefDeallocate                ; CODE XREF: __text:0000000100A03BE0↑p
 __stubs:0000000102FFE31C                 ADRP            X16, #_DNSServiceRefDeallocate_ptr@PAGE
 __stubs:0000000102FFE320                 LDR             X16, [X16,#_DNSServiceRefDeallocate_ptr@PAGEOFF]
 __stubs:0000000102FFE324                 BR              X16
 __stubs:0000000102FFE324 ; End of function _DNSServiceRefDeallocate
 __stubs:0000000102FFE324
 __stubs:0000000102FFE328
 __stubs:0000000102FFE328 ; =============== S U B R O U T I N E =======================================
 __stubs:0000000102FFE328
 __stubs:0000000102FFE328
 __stubs:0000000102FFE328 ; int __cdecl DNSServiceRefSockFD(DNSServiceRef sdRef)
 __stubs:0000000102FFE328 _DNSServiceRefSockFD                    ; CODE XREF: __text:0000000100A03248↑p
 __stubs:0000000102FFE328                 ADRP            X16, #_DNSServiceRefSockFD_ptr@PAGE
 __stubs:0000000102FFE32C                 LDR             X16, [X16,#_DNSServiceRefSockFD_ptr@PAGEOFF]
 __stubs:0000000102FFE330                 BR              X16
 __stubs:0000000102FFE330 ; End of function _DNSServiceRefSockFD
 __stubs:0000000102FFE330
 __stubs:0000000102FFE334 ; ---------------------------------------------------------------------------
 __stubs:0000000102FFE334
 __stubs:0000000102FFE334 _DisposeAUGraph                         ; CODE XREF: __text:00000001008175FC↑p
 __stubs:0000000102FFE334                 ADRP            X16, #_DisposeAUGraph_ptr@PAGE
 __stubs:0000000102FFE338                 LDR             X16, [X16,#_DisposeAUGraph_ptr@PAGEOFF]
 __stubs:0000000102FFE33C                 BR              X16     ; __imp__DisposeAUGraph
 __stubs:0000000102FFE340 ; ---------------------------------------------------------------------------
 __stubs:0000000102FFE340
 __stubs:0000000102FFE340 _ExtAudioFileDispose                    ; CODE XREF: __text:0000000100531EC8↑p
 __stubs:0000000102FFE340                                         ; __text:0000000100704CCC↑p
 __stubs:0000000102FFE340                 ADRP            X16, #_ExtAudioFileDispose_ptr@PAGE
 __stubs:0000000102FFE344                 LDR             X16, [X16,#_ExtAudioFileDispose_ptr@PAGEOFF]
 __stubs:0000000102FFE348                 BR              X16     ; __imp__ExtAudioFileDispose
 __stubs:0000000102FFE34C ; ---------------------------------------------------------------------------
 __stubs:0000000102FFE34C
 __stubs:0000000102FFE34C _ExtAudioFileGetProperty                ; CODE XREF: __text:0000000100531E60↑p
 __stubs:0000000102FFE34C                                         ; __text:0000000100531FF8↑p ...
 __stubs:0000000102FFE34C                 ADRP            X16, #_ExtAudioFileGetProperty_ptr@PAGE
 __stubs:0000000102FFE350                 LDR             X16, [X16,#_ExtAudioFileGetProperty_ptr@PAGEOFF]
 __stubs:0000000102FFE354                 BR              X16     ; __imp__ExtAudioFileGetProperty
 __stubs:0000000102FFE358 ; ---------------------------------------------------------------------------
 __stubs:0000000102FFE358
 __stubs:0000000102FFE358 _ExtAudioFileRead                       ; CODE XREF: __text:000000010053208C↑p
 __stubs:0000000102FFE358                                         ; __text:0000000100704E20↑p
 __stubs:0000000102FFE358                 ADRP            X16, #_ExtAudioFileRead_ptr@PAGE
 __stubs:0000000102FFE35C                 LDR             X16, [X16,#_ExtAudioFileRead_ptr@PAGEOFF]
 __stubs:0000000102FFE360                 BR              X16     ; __imp__ExtAudioFileRead
 __stubs:0000000102FFE364 ; ---------------------------------------------------------------------------
 __stubs:0000000102FFE364
 __stubs:0000000102FFE364 _ExtAudioFileSetProperty                ; CODE XREF: __text:0000000100531F8C↑p
 __stubs:0000000102FFE364                                         ; __text:0000000100704D60↑p
 __stubs:0000000102FFE364                 ADRP            X16, #_ExtAudioFileSetProperty_ptr@PAGE
 __stubs:0000000102FFE368                 LDR             X16, [X16,#_ExtAudioFileSetProperty_ptr@PAGEOFF]
 __stubs:0000000102FFE36C                 BR              X16     ; __imp__ExtAudioFileSetProperty
 __stubs:0000000102FFE370 ; ---------------------------------------------------------------------------
 __stubs:0000000102FFE370
 __stubs:0000000102FFE370 _ExtAudioFileWrapAudioFileID            ; CODE XREF: __text:0000000100531DF8↑p
 __stubs:0000000102FFE370                                         ; __text:0000000100704C38↑p
 __stubs:0000000102FFE370                 ADRP            X16, #_ExtAudioFileWrapAudioFileID_ptr@PAGE
 __stubs:0000000102FFE374                 LDR             X16, [X16,#_ExtAudioFileWrapAudioFileID_ptr@PAGEOFF]
 __stubs:0000000102FFE378                 BR              X16     ; __imp__ExtAudioFileWrapAudioFileID
 __stubs:0000000102FFE378 ; ---------------------------------------------------------------------------
 __stubs:0000000102FFE37C _IosMicAbnormal_Init DCB 0xF0
 __stubs:0000000102FFE37D                 DCB 0x45 ; E
 __stubs:0000000102FFE37E                 DCB    0
 __stubs:0000000102FFE37F                 DCB 0x90
 __stubs:0000000102FFE380                 DCB 0x10
 __stubs:0000000102FFE381                 DCB 0x8A
 __stubs:0000000102FFE382                 DCB 0x47 ; G
 __stubs:0000000102FFE383                 DCB 0xF9
 __stubs:0000000102FFE384                 DCB    0
 __stubs:0000000102FFE385                 DCB    2
 __stubs:0000000102FFE386                 DCB 0x1F
 __stubs:0000000102FFE387                 DCB 0xD6
 __stubs:0000000102FFE388 ; ---------------------------------------------------------------------------
 __stubs:0000000102FFE388
 __stubs:0000000102FFE388 _IsWebPImageData                        ; CODE XREF: __text:0000000101900B8C↑p
 __stubs:0000000102FFE388                 ADRP            X16, #_IsWebPImageData_ptr@PAGE
 __stubs:0000000102FFE38C                 LDR             X16, [X16,#_IsWebPImageData_ptr@PAGEOFF]
 __stubs:0000000102FFE390                 BR              X16     ; __imp__IsWebPImageData
 __stubs:0000000102FFE394 ; ---------------------------------------------------------------------------
 __stubs:0000000102FFE394
 __stubs:0000000102FFE394 _JSClassCreate                          ; CODE XREF: __text:00000001003CBC14↑p
 __stubs:0000000102FFE394                                         ; __text:00000001006DB8F8↑p ...
 __stubs:0000000102FFE394                 ADRP            X16, #_JSClassCreate_ptr@PAGE
 __stubs:0000000102FFE398                 LDR             X16, [X16,#_JSClassCreate_ptr@PAGEOFF]
 __stubs:0000000102FFE39C                 BR              X16     ; __imp__JSClassCreate
 __stubs:0000000102FFE3A0 ; ---------------------------------------------------------------------------
 */

@end
