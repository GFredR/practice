//
//  ViewController.m
//  UICollectionViewTest


#import "ViewController.h"
#import "DetailViewController.h"

@implementation ViewController{
	NSArray* _books;
	NSArray* _covers;
}
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 创建并初始化NSArray对象
	_books = @[@"Ajax",
			 @"Android",
			 @"HTML5/CSS3/JavaScript" ,
			 @"Java讲义",
			 @"Java",
			 @"Java EE",
			 @"Java EE",
			 @"Swift"];
	// 创建并初始化NSArray对象
	_covers = [NSArray arrayWithObjects:@"ajax.png",
			  @"android.png",
			  @"html.png" ,
			  @"java.png",
			  @"java2.png",
			  @"javaee.png",
			  @"javaee2.png",
			  @"swift.png", nil];
	// 为当前导航项设置标题
	self.navigationItem.title = @"图书列表";
	// 为UICollectionView设置dataSource和delegate
	self.grid.dataSource = self;
	self.grid.delegate = self;
	// 创建UICollectionViewFlowLayout布局对象
	UICollectionViewFlowLayout *flowLayout =
	[[UICollectionViewFlowLayout alloc] init];
	// 设置UICollectionView中各单元格的大小
	flowLayout.itemSize = CGSizeMake(120, 160);
	// 设置该UICollectionView只支持水平滚动
	flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
	// 设置各分区上、下、左、右空白的大小
	flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
	// 设置两行单元格之间的行距
	flowLayout.minimumLineSpacing = 5;
	// 设置两个单元格之间的间距
	flowLayout.minimumInteritemSpacing = 0;
	// 为UICollectionView设置布局对象
	self.grid.collectionViewLayout = flowLayout;
}
// 该方法的返回值决定各单元格的控件
- (UICollectionViewCell *)collectionView:(UICollectionView *)
	collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	// 为单元格定义一个静态字符串作为标识符
	static NSString* cellId = @"bookCell";  // ①
	// 从可重用单元格的队列中取出一个单元格
	UICollectionViewCell* cell = [collectionView
		dequeueReusableCellWithReuseIdentifier:cellId
		forIndexPath:indexPath];
	// 设置圆角
	cell.layer.cornerRadius = 8;
	cell.layer.masksToBounds = YES;
	NSInteger rowNo = indexPath.row;
	// 通过tag属性获取单元格内的UIImageView控件
	UIImageView* iv = (UIImageView*)[cell viewWithTag:1];
	// 为单元格内的图片控件设置图片
	iv.image = [UIImage imageNamed:_covers[rowNo]];
	// 通过tag属性获取单元格内的UILabel控件
	UILabel* label = (UILabel*)[cell viewWithTag:2];
	// 为单元格内的UILabel控件设置文本
	label.text = _books[rowNo];
	return cell;
}
// 该方法的返回值决定UICollectionView包含多少个单元格
- (NSInteger)collectionView:(UICollectionView *)collectionView
	 numberOfItemsInSection:(NSInteger)section
{
	return _books.count;
}
// 当用户单击单元格跳转到下一个视图控制器时激发该方法
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// 获取激发该跳转的单元格
	UICollectionViewCell* cell = (UICollectionViewCell*)sender;
	// 获取该单元格所在的NSIndexPath
	NSIndexPath* indexPath = [self.grid indexPathForCell:cell];
	NSInteger rowNo = indexPath.row;
	// 获取跳转的目标视图控制器：DetailViewController控制器
	DetailViewController *detailController = segue.destinationViewController;
	// 将选中单元格内的数据传给DetailViewController控制器对象
	detailController.imageName = _covers[rowNo];
	detailController.bookNo = rowNo;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:
	(UICollectionViewLayout*)collectionViewLayout
	sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	// 获取indexPath对应的单元格将要显示的图片
	UIImage* image = [UIImage imageNamed:
		_covers[indexPath.row]];
	// 控制该单元格的大小为它显示的图片大小的一半
	return CGSizeMake(image.size.width / 2
		, image.size.height / 2);
}
@end
