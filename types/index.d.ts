// CREDITS: These types are based on the original work made by all the people who contributed to @types/react-native

import { Component, ReactElement } from 'react';
import { ViewProps } from 'react-native';

interface MaskedViewProps extends ViewProps {
  maskElement: ReactElement;
}

/**
 * @see https://github.com/react-native-community/react-native-masked-view
 */
export default class MaskedView extends Component<MaskedViewProps> {}
