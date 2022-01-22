# Run Analysis

## Description

The is an analysis of data collected from people wearing Samsung Galaxy S IIs on their waist. It collects information of subjects doing different activities (running, walking, standing,etc) using an accelerometer and gyroscope. Further information about this dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).\
This analysis combines all of data collected from testing and training into one dataset. It then extracts measurements that have calculated mean and standard deviation. This dataset is called `extracted`. A second dataset is also created (called `tidy`) that contains the average of each variable for each activity and subject.\
The following image is helpful to understand how the files in the dataset should be structured/organized.\
![Dataset Structure](./analysis_grid.png)\

### Build Notes

This script was built using R version 4.1.1 (2021-08-10) on macOS Big Sur version 11.6

### License

MIT License

Copyright (c) [2021] [Suzannah Herron]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
  
  The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
