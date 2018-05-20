//
//  ViewController.m
//  UISearchBarTest


#import "ViewController.h"

@implementation ViewController{
	UISearchBar * _searchBar;
	// 保存原始表格数据的NSArray对象
	NSArray * _tableData;
	// 保存搜索结果数据的NSArray对象
	NSArray* _searchData;
	BOOL _isSearch;
}
- (void)viewDidLoad
{
	[super viewDidLoad];
	_isSearch = NO;
	// 初始化原始表格数据
	_tableData = @[@"Java教程",
				 @"Java EE教程",
				 @"Android教程",
				 @"Ajax讲义",
				 @"HTML5/CSS3/JavaScript教程",
				 @"iOS讲义",
				 @"Swift教程",
				 @"Java EE应用实战",
				 @"Java教程",
				 @"Java基础教程",
				 @"学习Java",
				 @"Objective-C教程" ,
				 @"Ruby教程",
				 @"iOS开发教程"];
	// 设置UITableView控件的delegate、dataSource都是该控制器本身
	self.table.delegate = self;
	self.table.dataSource = self;
	// 创建UISearchBar控件
	_searchBar = [[UISearchBar alloc] initWithFrame:
		CGRectMake(0, 0 , self.table.bounds.size.width, 44)];
	_searchBar.placeholder = @"输入字符";
	_searchBar.showsCancelButton = YES;
	self.table.tableHeaderView = _searchBar;
	// 设置搜索条的delegate是该控制器本身
	_searchBar.delegate	= self;
}
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	// 如果处于搜索状态
	if(_isSearch)
	{
		// 使用_searchData作为表格显示的数据
		return _searchData.count;
	}
	else
	{
		// 否则使用原始的_tableData作为表格显示的数据
		return _tableData.count;
	}
}

- (UITableViewCell*) tableView:(UITableView *)tableView
	cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
	static NSString* cellId = @"cellId";
	// 从可重用的表格行队列中获取表格行
	UITableViewCell* cell = [tableView
		dequeueReusableCellWithIdentifier:cellId];
	// 如果表格行为nil
	if(!cell)
	{
		// 创建表格行
		cell = [[UITableViewCell alloc] initWithStyle:
			UITableViewCellStyleDefault reuseIdentifier:cellId];
	}
	// 获取当前正在处理的表格行的行号
	NSInteger rowNo = indexPath.row;
	// 如果处于搜索状态
	if(_isSearch) {
		// 使用_searchData作为表格显示的数据
		cell.textLabel.text = _searchData[rowNo];
	}
	else {
		// 否则使用原始的_tableData作为表格显示的数据
		cell.textLabel.text = _tableData[rowNo];
	}
	return cell;
}
// UISearchBarDelegate定义的方法，用户单击取消按钮时激发该方法
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	// 取消搜索状态
	_isSearch = NO;
	[self.table reloadData];
}
// UISearchBarDelegate定义的方法，当搜索文本框内的文本改变时激发该方法
- (void)searchBar:(UISearchBar *)searchBar
	textDidChange:(NSString *)searchText
{
	// 调用filterBySubstring:方法执行搜索
	[self filterBySubstring:searchText];
}
// UISearchBarDelegate定义的方法，用户单击虚拟键盘上的Search按键时激发该方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	// 调用filterBySubstring:方法执行搜索
	[self filterBySubstring:searchBar.text];
	// 放弃作为第一个响应者，关闭键盘
	[searchBar resignFirstResponder];
}
- (void) filterBySubstring:(NSString*) subStr
{
	// 设置为搜索状态
	_isSearch = YES;
	// 定义搜索谓词
	NSPredicate* pred = [NSPredicate predicateWithFormat:
		@"SELF CONTAINS[c] %@" , subStr];
	// 使用谓词过滤NSArray
	_searchData = [_tableData filteredArrayUsingPredicate:pred];
	// 让表格控件重新加载数据
	[self.table reloadData];
}
@end
