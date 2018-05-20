//
//  ViewController.m
//  DynaCell
//

#import "ViewController.h"

@implementation ViewController{
	NSArray* _books;
}
- (void)viewDidLoad
{
	[super viewDidLoad];
	self.tableView.dataSource = self;
	_books = @[@"Android", @"iOS", @"Ajax",
		@"Swift"];
}
- (NSInteger)tableView:(UITableView *)tableView
	numberOfRowsInSection:(NSInteger)section
{
	return _books.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
	cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger rowNo = indexPath.row;  // 获取行号
	// 根据行号的奇偶性使用不同的标识符
	NSString* identifier = rowNo % 2 == 0 ? @"cell1" : @"cell2";
	// 根据identifier获取表格行（identifier要么是cell1，要么是cell2）
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
		identifier forIndexPath:indexPath];
	// 获取cell内包含的Tag为1的UILabel
	UILabel* label = (UILabel*)[cell viewWithTag:1];
	label.text = _books[rowNo];
	return cell;
}
@end
