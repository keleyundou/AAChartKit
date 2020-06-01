//
//  FirstViewController.m
//  AAChartKit
//
//  Created by An An on 17/3/14.
//  Copyright © 2017年 An An. All rights reserved.
//*************** ............ SOURCE CODE ............ ***************
//***.............................................................  ***
//*** iOS     :https://github.com/AAChartModel/AAChartKit           ***
//*** iOS     :https://github.com/AAChartModel/AAChartKit-Swift     ***
//*** Android :https://github.com/AAChartModel/AAChartCore          ***
//*** Android :https://github.com/AAChartModel/AAChartCore-Kotlin   ***
//***...............................................................***
//*************** ............ SOURCE CODE ............ ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * 🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "SpecialChartVC.h"
#import "OnlyRefreshChartDataVC.h"
#import "ChartAnimationTypeVC.h"
#import "DrawChartWithAAOptionsVC.h"
#import "ShowManyChartViewVC.h"
#import "ChartListVC.h"
#import "MixedChartVC.h"
#import "HideOrShowChartSeriesVC.h"
#import "CustomStyleChartVC.h"
#import "MonitorViewController.h"
#import "JSFormatterFunctionVC.h"
#import "EvaluateJSStringFunctionVC.h"
#import "ScrollingUpdateDataVC.h"
#import "DoubleChartsLinkedWorkVC.h"
#import "DrawableChartVC.h"

#define ColorWithRGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define AAGrayColor            [UIColor colorWithRed:245/255.0 green:246/255.0 blue:247/255.0 alpha:1.0]
#define AABlueColor            ColorWithRGB(63, 153,231,1)

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *chartTypeNameArr;
@property (nonatomic, strong) NSArray *sectionTypeArr;

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AAChartKit";
    self.view.backgroundColor = [UIColor whiteColor];

    [self configTheTableView];
}

- (void)configTheTableView {
    UITableView *tableView = [[UITableView alloc]init];
    tableView.delegate =self;
    tableView.dataSource =self;
    tableView.frame = CGRectMake(0, 0, 100, self.view.frame.size.height);
    [self.view addSubview:tableView];
    
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[self configureTheConstraintArrayWithItem:tableView toItem:self.view]];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.chartTypeNameArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]init];
    
    UILabel *label = [[UILabel alloc]init];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:16.0f];
    label.backgroundColor = AAGrayColor;
    label.textColor = [UIColor purpleColor];
    label.text = self.sectionTypeArr[section];
    [view addSubview:label];
    
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [view addConstraints:[self configureTheConstraintArrayWithItem:label toItem:view]];
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = self.chartTypeNameArr[section];
    return arr.count;
}

- (NSArray *) sectionIndexTitlesForTableView: (UITableView *)tableView {
    NSMutableArray *listTitles = [[NSMutableArray alloc] init];
    for (NSString *item in self.sectionTypeArr) {
          NSString *title = [item substringToIndex: 1];
          [listTitles addObject: title];
    }
    return listTitles;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.chartTypeNameArr[indexPath.section][indexPath.row];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0: {
            /*基础类型图表*/
            SecondViewController *vc = SecondViewController.new;
            vc.chartType = indexPath.row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        case 1: {
            /*特殊类型图表*/
            SpecialChartVC *vc = SpecialChartVC.new;
            vc.selectedIndex = indexPath.row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[indexPath.section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 2: {
            /*一些自定义样式图表*/
            CustomStyleChartVC *vc = CustomStyleChartVC.new;
            vc.chartType = indexPath.row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[indexPath.section];
            [self.navigationController  pushViewController:vc animated:YES];
        }
            break;
            
        case 3: {
            /*图表数据动态刷新*/
            MixedChartVC *vc = MixedChartVC.new;
            vc.chartTypeIndex = indexPath.row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[indexPath.section];
            [self.navigationController  pushViewController:vc animated:YES];
        }
            break;
            
        case 4: {
            /*图表数据动态刷新*/
            OnlyRefreshChartDataVC *vc = OnlyRefreshChartDataVC.new;
            vc.chartType = indexPath.row;
            [self.navigationController  pushViewController:vc animated:YES];
        }
            break;
            
        case 5: {
            /*JQuery动画样式类型演示*/
            ChartAnimationTypeVC *vc = ChartAnimationTypeVC.new;
            vc.chartType = indexPath.row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        case 6: {
            /*通过AAOptions实例对象来绘制图形*/
            DrawChartWithAAOptionsVC *vc = DrawChartWithAAOptionsVC.new;
            vc.selectedIndex = indexPath.row;
            vc.navigationItemTitleArr = self.chartTypeNameArr[indexPath.section];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 7: {
            /*同时显示多个 AAChartView*/
            if (indexPath.row == 0) {
                ShowManyChartViewVC *vc = ShowManyChartViewVC.new;
                [self.navigationController pushViewController:vc animated:YES];
            } else if (indexPath.row == 1) {
                ChartListVC *listVC = ChartListVC.new;
                [self.navigationController pushViewController:listVC animated:YES];
            } else {
                DoubleChartsLinkedWorkVC *vc = DoubleChartsLinkedWorkVC.new;
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
            break;
            
        case 8: {
            HideOrShowChartSeriesVC *vc = HideOrShowChartSeriesVC.new;
            vc.chartTypeIndex = indexPath.row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 9: {
            JSFormatterFunctionVC *vc = JSFormatterFunctionVC.new;
            vc.selectedIndex = indexPath.row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 10: {
            /*基础类型图表*/
            EvaluateJSStringFunctionVC *vc = EvaluateJSStringFunctionVC.new;
            vc.sampleChartTypeIndex = indexPath.row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 11: {
            /*基础类型图表*/
            ScrollingUpdateDataVC *vc = ScrollingUpdateDataVC.new;
            vc.chartType = indexPath.row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 12: {
            /*基础类型图表*/
            DrawableChartVC *vc = DrawableChartVC.new;
            vc.chartType = indexPath.row;
            vc.type = DrawableChartVCTypeUpdateXAxsiExtremes;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 13: {
            /*基础类型图表*/
            DrawableChartVC *vc = DrawableChartVC.new;
            vc.chartType = indexPath.row;
            vc.type = DrawableChartVCTypeChangeChartViewContentSize;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        default:
            break;
    }
    
}

- (NSArray *)configureTheConstraintArrayWithItem:(UIView *)view1 toItem:(UIView *)view2 {
    return  @[[NSLayoutConstraint constraintWithItem:view1
                                           attribute:NSLayoutAttributeLeft
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:view2
                                           attribute:NSLayoutAttributeLeft
                                          multiplier:1.0
                                            constant:0],
              [NSLayoutConstraint constraintWithItem:view1
                                           attribute:NSLayoutAttributeRight
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:view2
                                           attribute:NSLayoutAttributeRight
                                          multiplier:1.0
                                            constant:0],
              [NSLayoutConstraint constraintWithItem:view1
                                           attribute:NSLayoutAttributeTop
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:view2
                                           attribute:NSLayoutAttributeTop
                                          multiplier:1.0
                                            constant:0],
              [NSLayoutConstraint constraintWithItem:view1
                                           attribute:NSLayoutAttributeBottom
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:view2
                                           attribute:NSLayoutAttributeBottom
                                          multiplier:1.0
                                            constant:0],
              
              ];
}

- (NSArray *)sectionTypeArr {
    if (!_sectionTypeArr) {
        _sectionTypeArr = @[
            @"Basic Type---基础类型",
            @"Special Type---特别类型",
            @"Custom Style---自定义风格样式图表",
            @"Mixed Type Chart---混合图表",
            @"Only Refresh data---单纯刷新数据",
            @"Animation Type---渲染动画",
            @"Draw Chart With AAOptions---通过Options绘图",
            @"Many ChartView simultaneously---同时显示多个AAChartView",
            @"Hide Or Show Chart Series---隐藏或显示内容",
            @"Support JS Formatter Function",
            @"Evaluate JS String Function---执行js函数",
            @"X Axis Scrolling Updating Data---X轴水平滚动刷新",
            @"Drawable Chart---可拖拽的图表1📈",
            @"Drawable Chart---可拖拽的图表2📊",
            
        ];
    }
    return _sectionTypeArr;
}

- (NSArray *)chartTypeNameArr {
    if (!_chartTypeNameArr) {
        _chartTypeNameArr = @[
            /*基础类型图表*/
            @[@"Column Chart---柱形图",
              @"Bar Chart---条形图",
              @"Area Chart---折线填充图",
              @"Areaspline Chart---曲线填充图",
              @"Line Chart---折线图",
              @"Spline Chart---曲线图",
              @"Step Line Chart--直方折线图",
              @"Step Area Chart--直方折线填充图",
              @"Scatter Chart---散点图"
            ],
            /*特殊类型图表*/
            @[@"Pie Chart---扇形图",
              @"Bubble Chart---气泡图",
              @"Scatter Chart--散点图",
              @"Area Range Chart--折线区域面积图",
              @"Area Spline range Chart--曲线区域面积图",
              @"Column Range Chart--柱形范围图",
              @"Box Plot Chart---箱线图",
              @"Water Fall---瀑布图",
              @"Pyramid Chart---金字塔图",
              @"Funnel Chart---漏斗图",
              @"Error Bar Chart---误差图",
            ],
            /*自定义风格样式图表*/
            @[@"Colorful Column Chart---多彩条形图",
              @"Colorful Gradient Color Chart---多彩颜色渐变条形图",
              @"Discontinuous Data Chart---数值不连续的图表",
              @"Mixed Line Chart---虚实线混合折线图",
              @"Colorful Column Chart---多彩柱形图",
              @"Gradient Color Bar Chart---颜色渐变条形图",
              @"With Dividing Line---带有阈值分割线区域图",
              @"Area Chart with minus--带有负数的区域填充图",
              @"Step Line Chart--直方折线图",
              @"Step Area Chart--直方折线填充图",
              @"Nightingale Rose Chart---南丁格尔玫瑰图",
              @"Specific Data Customize Datalabel",
              @"Chart With Shadow Style---带有阴影效果の图表",
              @"Colorful gradient Areaspline Chart---多层次渐变区域填充图",
              @"Colorful gradient Spline Chart---多层次渐变曲线图",
              @"Gradient Color Areaspline Chart---半透明渐变效果区域填充图",
              @"Special Style Marker Of Single Data Element Chart",
              @"Special Style Column Of Single Data Element Chart",
              @"configure Area Chart Threshold---自定义阈值",
              @"custom Scatter Chart Marker Symbol Content---自定义散点图的标志点内容",
              @"custom Line Chart Marker Symbol Content---自定义折线图的标志点内容",
              @"Triangle Radar Chart---三角形雷达图",
              @"Quadrangle Radar Chart---四角形雷达图",
              @"Pentagon Radar Chart---五角形雷达图",
              @"Hexagon Radar Chart----六角形雷达图",
              @"adjustYAxisMaxAndMinValues----调整 X 轴和 Y 轴最大值",
              @"custom Special Style DataLabel Of Single Data Element Chart",
              @"custom Bar Chart Hover Color and Select Color---自定义条形图手指滑动颜色和单个长条被选中颜色",
              @"custom Line Chart Chart Hover And Select Halo Style",
              @"custom Spline Chart Marker States Hover Style",
              @"customNormalStackingChartDataLabelsContentAndStyle---自定义堆积柱状图 DataLabels 的内容及样式",
              @"upsideDownPyramidChart---倒立的金字塔图",
              @"doubleLayerPieChart---双层嵌套扇形图"
            ],
            /*混合类型图表*/
            @[@"Arearange Mixed Line---面积范围均线图",
              @"Columnrange Mixed Line---柱形范围图混合折线图",
              @"Stacking Column Mixed Line---堆积柱形图混合折线图",
              @"Dash Style Types Mixed---多种类型曲线混合图",
              @"All Line Dash Style Types Mixed Chart---所有类型曲线混合图",
              @"Negative Color Mixed---基准线以下异色混合图",
              @"scatterMixedLine---散点图混合折线图",
              @"Negative Color Mixed bubble---基准线以下异色气泡图",
              @"Polygon Mixed Scatter---多边形混合散点图",
              @"Polar Chart Mixed---极地混合图",
              @"configure Column Mixed Scatter Chart---柱形图混合散点图"
            ],
            /*图表数据动态刷新*/
            @[@"Column Chart---柱形图",
              @"Bar Chart---条形图",
              @"Area Chart---折线填充图",
              @"Areaspline Chart---曲线填充图",
              @"Line Chart---折线图",
              @"Spline Chart---曲线图",
              @"Step Line Chart--直方折线图",
              @"Step Area Chart--直方折线填充图",
              @"Scatter Chart---散点图"
            ],
            /*JQuery动画样式类型演示*/
            @[@"Column Chart---柱形图",
              @"Bar Chart---条形图",
              @"Area Chart---折线填充图",
              @"Areaspline Chart---曲线填充图",
              @"Line Chart---折线图",
              @"Spline Chart---曲线图",
              @"Step Line Chart--直方折线图",
              @"Step Area Chart--直方折线填充图",
              @"Scatter Chart --散点图",
              @"Pie Chart --扇形图"
            ],
            /*通过AAOptions实例对象来绘制图形*/
            @[@"绘制legend居顶部的区域填充图",
              @"绘制带有中心标题的环形图",
              @"调整扇形图的标题和DataLabel字体样式",
              @"绘制嵌套的柱状图",
              @"多边形线框的雷达图",
              @"缝隙很小的柱状图",
              @"Custom style tooltip--自定义浮动提示框",
              @"调整图表的左右边距",
              @"设置图表绘图区的背景图片",
              @"Double Y Axises Chart---双Y轴混合图",
              @"Adjust Data Accuracy---调整数据精度",
              @"Adjust Group Padding---调整group间距",
              @"Custom Style Stacked Column---自定义堆积柱状图",
              @"时间不连续的直方折线填充图连接图",
              @"Disable Animation ---禁用动画效果",
              @"Custom Legend Item Style---自定义图例样式",
              @"Mirror Chart ---镜像效果的柱状图",
              @"y轴在右侧的图表",
              @"简易仪表图",
              @"带有颜色带的仪表图",
              @"带有颜色标志带的图表",
              @"带有颜色标志线的图表",
              @"数据分区 Zones",
              @"数据分区 Zones 和颜色标志线混合",
              @"自定义DataLabels样式",
              @"单独自定义指定的data的DataLabels样式",
              @"通过HTML字符串自定义X轴文字颜色",
              @"通过HTML字符串自定义X轴文字颜色和字体大小",
              @"配置DataLabels、XAXis、YAxis、Legend等图表元素样式",
              @"X轴带有颜色标志带的混合图表",
              @"允许DataLabels文字溢出绘图区",
              @"调整Y轴倒转的条形图的DataLabels风格样式",
              @"Triple Y Axes Mixed Chart---三条 Y 轴的混合图",
              @"Double Y Axes And Column Line Mixed Chart---双Y轴柱形曲线混合图",
              @"Double Y Axes Market Depth Chart---双Y轴市场深度图",
              @"custom Area Chart Tooltip Style Like HTML Table---自定义 tooltip 提示框为 HTML 表格样式",
              @"adjust Pie Chart Title And Data Label Font Style---自定义饼图的标题和 DataLabels",
              @"custom Chart Style When No Data---数据为空的情况下,配置图表的 x 轴 y 轴等样式",
              @"custom Chart Style When Every Data Value Is 0---所有数据都为 0 的情况下, 配置图表的 x 轴 y 轴等样式",
            ],
            /*同时显示多个 AAChartView*/
            @[@"同时显示多个 AAChartView",
              @"UITableView上显示多个 AAChartView",
              @"Double Charts Linked Working---双表联动",
            ],
            /*隐藏或显示图表的Series*/
            @[@"Column Chart---柱形图",
              @"Bar Chart---条形图",
              @"Area Chart---折线填充图",
              @"Areaspline Chart---曲线填充图",
              @"Line Chart---折线图",
              @"Spline Chart---曲线图",
              @"Step Line Chart--直方折线图",
              @"Step Area Chart--直方折线填充图",
              @"Scatter Chart---散点图"
            ],
            /*JS Formatter Function*/
            @[@"简单字符串拼接",
              @"自定义不同单位后缀",
              @"值为0时,在tooltip中不显示",
              @"自定义多彩颜色文字",
              @"自定义箱线图的浮动提示框头部内容",
              @"自定义Y轴文字",
              @"自定义分组堆积柱状图tooltip内容",
              @"每根棱柱都有白色背景的柱形图",
              @"每根棱柱都有空心白色边缘线的柱形图",
              @"温度计🌡风格的彩色棱柱图",
              @"外部显示六边形边框的三角形雷达图",
              @"双 X 轴镜像条形图",
              @"自定义 X 轴文字单位后缀(通过 formatter 函数)",
              @"自定义X轴文字单位后缀(不通过 formatter 函数)",
              @"自定义面积范围图的 tooltip",
              @"调整折线图的 X 轴左边距",
              @"通过来自外部的数据源来自定义 tooltip (而非常规的来自图表的 series)",
              @"custom Spider Chart Style---自定义蜘蛛图🕷🕸样式"
            ],
            /*执行由 JavaScript 字符串映射转换成的 js function 函数*/
            @[
                @"Custom Chart DataLabel Sample One",
                @"Custom Chart DataLabel Sample Two",
                @"Custom Chart StackLabel Sample ",
                @"Support Dragging Chart On X Axis",
            ],
            /*基础类型图表X轴水平滚动刷新*/
            @[@"Column Chart---柱形图",
              @"Bar Chart---条形图",
              @"Area Chart---折线填充图",
              @"Areaspline Chart---曲线填充图",
              @"Line Chart---折线图",
              @"Spline Chart---曲线图",
              @"Step Line Chart--直方折线图",
              @"Step Area Chart--直方折线填充图",
              @"Scatter Chart---散点图"
            ],
            /*基础类型图表X轴水平拖动类型 1*/
            @[@"Column Chart---柱形图",
              @"Bar Chart---条形图",
              @"Area Chart---折线填充图",
              @"Areaspline Chart---曲线填充图",
              @"Line Chart---折线图",
              @"Spline Chart---曲线图",
              @"Step Line Chart--直方折线图",
              @"Step Area Chart--直方折线填充图",
              @"Scatter Chart---散点图"
            ],
            /*基础类型图表X轴水平拖动类型 2*/
            @[@"Column Chart---柱形图",
              @"Bar Chart---条形图",
              @"Area Chart---折线填充图",
              @"Areaspline Chart---曲线填充图",
              @"Line Chart---折线图",
              @"Spline Chart---曲线图",
              @"Step Line Chart--直方折线图",
              @"Step Area Chart--直方折线填充图",
              @"Scatter Chart---散点图"
            ],
        ];
    }
    return _chartTypeNameArr;
}

@end
