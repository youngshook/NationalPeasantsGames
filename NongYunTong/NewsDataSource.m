//
//  NewsDataSource.m
//  NongYunTong
//
//  Created by YoungShook on 12-6-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NewsDataSource.h"
#import "TFHpple.h"
#define WEBSITE @"http://www.ny2012.cn/Article/xwbb/Index.shtml"
@implementation NewsDataSource
@synthesize arrayUrl,arrayTitle,publishTime,arrayImage,arrayTextBody;

-(id)init{
    if (self = [super init]) {
        
    }
    return self;
}

-(void)setLoadData{

    arrayUrl = [[NSMutableArray alloc]init];//存储文章URL地址
    arrayImage = [[NSMutableArray alloc]init];//储存文章中的图片URL
    arrayTitle = [[NSMutableArray alloc]init];//储存文章题目
    publishTime = [[NSMutableArray alloc]init];//储存文章发布时间
    arrayTextBody = [[NSMutableArray alloc]init];//储存文章正文
    NSData *siteData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:WEBSITE]];
    NSString *siteString  =[[NSString alloc]initWithContentsOfURL:[NSURL URLWithString:WEBSITE]];    
    NSArray *url = [siteString componentsSeparatedByString:@"href=\"/Article/xwbb/"];
   
    //合并字符串，生成每行的url链接，获取每个文章URL
    int flag=0;
    for (NSString* URL in url)
        {
            flag++;
            
            if (flag<22) 
                {
            
                URL=[URL substringToIndex:10];

                NSString *urlNew = [NSString stringWithString:@"http://www.ny2012.cn/Article/xwbb/"];
                urlNew = [urlNew stringByAppendingString:URL];
         
                if(flag>1)
                    {
                        [arrayUrl addObject:urlNew];
                    }
                }
        
        
        }
    
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:siteData];
    NSArray *elements = [xpathParser search:@"//a[@title]"];
    
    //获取文章标题
    int i=0;
    for (TFHppleElement *element in elements)
        {
            
            i++;
            if(i<21)
                {
                NSString *strs = [element content];
                [arrayTitle addObject:strs];
                }
            }
            
    //获取正文信息及发表时间
    for (NSString *url in arrayUrl) 
    {
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000); 
    NSError *error  = [[NSError alloc]init];
    NSString *textString = [[NSString alloc]initWithContentsOfURL:[NSURL URLWithString:url] encoding:enc error:&error];
    
    //获取文章发表时间
    NSArray *getTime = [textString componentsSeparatedByString:@"2012-"];
    NSString *time = [NSString stringWithString:[getTime objectAtIndex:1]];
    time = [time substringToIndex:13];
    NSArray *times = [time componentsSeparatedByString:@":"]; 
    NSString *pubTime = [[NSString alloc]initWithFormat:@"%@:%@",[times objectAtIndex:0],[times objectAtIndex:1]];
    
    
    NSArray *getnews = [textString componentsSeparatedByString:@"style=\"padding-left:10px; padding-top:15px; padding-bottom:10px;\">"];
    NSString  *flagText = [NSString stringWithString:[getnews objectAtIndex:1]];
    NSArray *getnews1 = [flagText componentsSeparatedByString:@"</td>"];
    NSString *news = [NSString stringWithString:[getnews1 objectAtIndex:0]];
        
    //判断文章内是否存在图片信息
    NSRange range = [news rangeOfString:@"<IMG onmousewheel=\"return bbimg(this)\" border=0 hspace=0 alt=\"\" src=\""];
    
    if (range.location != NSNotFound) 
        {
            NSArray *images =[NSArray arrayWithArray:[news  componentsSeparatedByString:@"<IMG onmousewheel=\"return bbimg(this)\" border=0 hspace=0 alt=\"\" src=\""]];
            NSMutableArray *imagesArray = [[NSMutableArray alloc]init];
            NSString  *stringImage = [[images objectAtIndex:1] substringToIndex:48];
            NSMutableString *imageString = [NSString stringWithFormat:@"http://www.ny2012.cn%@",stringImage];
            int countflag = [images count];
            int flagcount = 0;
            for (NSString *image in images)
                {
                flagcount++;
                NSMutableString *imageformat = [[NSMutableString alloc]initWithString:image];
                if (flagcount < countflag) {
                    [imageformat appendFormat:@"<IMG onmousewheel=\"return bbimg(this)\" border=0 hspace=0 alt=\"\" src=\"http://www.ny2012.cn"];
                }
                
                [imagesArray addObject:imageformat];
                [imageformat release];
                
                }
        
            NSMutableString *getnews2= [[NSMutableString alloc]initWithString:@""];
            
            for(NSString *image in imagesArray)
                {
                [getnews2 appendString:image];
                }
            news = [NSString stringWithFormat:@"%@",getnews2];
            
            
            [arrayImage addObject:imageString];
            [imagesArray release];
            [getnews2 release];
        }
        else 
        {
        [arrayImage addObject:@"null"];
        }
    [arrayTextBody addObject:news];   
    [publishTime addObject:pubTime];
    [pubTime release];
    [error release];
    [textString release];
    }    
    
	[xpathParser release];
    [siteData release];
    [siteString release];

}

-(void)dealloc{
    [arrayTextBody release];
    [arrayImage release];
    [arrayTitle release];
    [arrayUrl release];
    [publishTime release];
    [super dealloc];
}

@end
