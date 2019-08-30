/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "RNCMaskedView.h"

#import <React/NSView+React.h>

@implementation RNCMaskedView

- (void)didUpdateReactSubviews
{
  // RNCMaskedView expects that the first subview rendered is the mask.
  NSView *maskView = [self.reactSubviews firstObject];
  self.layer.mask = maskView.layer.mask;
  // self.maskView = maskView;

  // Add the other subviews to the view hierarchy
  for (NSUInteger i = 1; i < self.reactSubviews.count; i++) {
    NSView *subview = [self.reactSubviews objectAtIndex:i];
    [self addSubview:subview];
  }
}

- (void)displayLayer:(CALayer *)layer
{
  // RNCView uses displayLayer to do border rendering.
  // We don't need to do that in RNCMaskedView, so we
  // stub this method and override the default implementation.
}

@end
