/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "RNCMaskedView.h"

#import <React/NSView+React.h>
#import <React/UIImageUtils.h>

@implementation RNCMaskedView
{
  RCTView *_maskView;
}

- (instancetype)initWithFrame:(NSRect)frame
{
  if (self = [super initWithFrame:frame]) {
    [self ensureLayerExists];
    
    _maskView = [[RCTView alloc] initWithFrame:NSZeroRect];
    _maskView.canDrawSubviewsIntoLayer = YES;
    [_maskView ensureLayerExists];
  }
  return self;
}

- (BOOL)isFlipped
{
  // HACK: Not sure why this is necessary when YES usually puts us in the top-left AFAIK.
  // NOTE: This may have other side effects?
  return NO;
}

- (void)didUpdateReactSubviews
{
  // The first subview is always the mask.
  [_maskView addSubview:self.reactSubviews[0]];

  // Add the other subviews to the view hierarchy.
  for (NSUInteger i = 1; i < self.reactSubviews.count; i++) {
    NSView *subview = [self.reactSubviews objectAtIndex:i];
    [self addSubview:subview];
  }
}

- (void)displayLayer:(CALayer *)layer
{
  NSRect bounds = layer.bounds;
  
  // Ensure the maskView fits to our layer.
  _maskView.frame = bounds;
  
  // The maskView is never drawn unless we do this.
  NSBitmapImageRep *bitmap = [_maskView bitmapImageRepForCachingDisplayInRect:bounds];
  [_maskView cacheDisplayInRect:bounds toBitmapImageRep:bitmap];
  
  // Use maskView.layer directly so animations are reflected in the mask.
  layer.mask = _maskView.layer;
}

@end
