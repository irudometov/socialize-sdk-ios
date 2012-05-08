//
//  SampleListViewController.m
//  SocializeSDK
//
//  Created by Nathaniel Griswold on 5/7/12.
//  Copyright (c) 2012 Socialize, Inc. All rights reserved.
//

#import "SampleListViewController.h"
#import "SZUserUtils.h"

static NSString *CellIdentifier = @"CellIdentifier";

static NSString *kSectionIdentifier = @"kSectionIdentifier";
static NSString *kSectionTitle = @"kSectionTitle";
static NSString *kSectionRows = @"kSectionRows";

static NSString *kRowExecutionBlock = @"kRowExecutionBlock";
static NSString *kRowText = @"kRowText";

static NSString *kUserSection = @"kUserSection";

@interface SampleListViewController ()
@property (nonatomic, retain) NSArray *sections;
@end

@implementation SampleListViewController
@synthesize sections = sections_;

- (void)dealloc {
    self.sections = nil;
    
    [super dealloc];
}

- (NSArray*)createSections {
    
    // User Utilities
    NSMutableArray *userRows = [NSMutableArray array];
    
    [userRows addObject:[self rowWithText:@"Show user profile" executionBlock:^{
        id<SocializeFullUser> user = [SZUserUtils currentUser];
        [SZUserUtils showUserProfileWithViewController:self user:user];
    }]];

    [userRows addObject:[self rowWithText:@"Show user settings" executionBlock:^{
        [SZUserUtils showUserSettingsWithViewController:self];
    }]];
    
    return [NSArray arrayWithObjects:
            [self sectionWithIdentifier:kUserSection
                                  title:@"User Utilities"
                                   rows:userRows],
            nil];
}

- (void)viewDidLoad {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"socialize_logo.png"]];
    imageView.contentMode = UIViewContentModeCenter;
    imageView.alpha = 0.25;
    self.tableView.backgroundView = imageView;
}

- (NSArray*)sections {
    if (sections_ == nil) {
        sections_ = [[self createSections] retain];
    }
    
    return sections_;
}

- (NSDictionary*)sectionWithIdentifier:(NSString*)identifier title:(NSString*)title rows:(NSArray*)rows {
    return [NSDictionary dictionaryWithObjectsAndKeys:
            identifier, kSectionIdentifier,
            title, kSectionTitle,
            rows, kSectionRows,
            nil];
}

- (NSDictionary*)rowWithText:(NSString*)text executionBlock:(void(^)())executionBlock {
    return [NSDictionary dictionaryWithObjectsAndKeys:
            text, kRowText,
            [[executionBlock copy] autorelease], kRowExecutionBlock,
            nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self.sections objectAtIndex:section] objectForKey:kSectionRows] count];
}

- (NSDictionary*)sectionDataForSection:(NSUInteger)section {
    return [self.sections objectAtIndex:section];
}

- (NSDictionary*)rowDataForIndexPath:(NSIndexPath*)indexPath {
    NSDictionary *section = [self sectionDataForSection:indexPath.section];
    NSDictionary *data = [[section objectForKey:kSectionRows] objectAtIndex:indexPath.row];
    
    return data;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *rowData = [self rowDataForIndexPath:indexPath];
    cell.textLabel.text = [rowData objectForKey:kRowText];
//    cell.textLabel.textColor = [UIColor whiteColor];

    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *sectionData = [self sectionDataForSection:section];
    return [sectionData objectForKey:kSectionTitle];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *rowData = [self rowDataForIndexPath:indexPath];
    void (^executionBlock)() = [rowData objectForKey:kRowExecutionBlock];
    executionBlock();
}

@end