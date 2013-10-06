//
//  BCBCell.m
//  AutoTable
//
//  Created by Steven Vandeweghe on 10/5/13.
//  Copyright (c) 2013 Blue Crowbar. All rights reserved.
//

#import "BCBCell.h"

@implementation BCBCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
