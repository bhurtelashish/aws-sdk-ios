//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSCloudWatchResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSCloudWatchResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSCloudWatchResources

+ (instancetype)sharedInstance {
    static AWSCloudWatchResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSCloudWatchResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2010-08-01\",\
    \"endpointPrefix\":\"monitoring\",\
    \"protocol\":\"query\",\
    \"serviceAbbreviation\":\"CloudWatch\",\
    \"serviceFullName\":\"Amazon CloudWatch\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"monitoring-2010-08-01\",\
    \"xmlNamespace\":\"http://monitoring.amazonaws.com/doc/2010-08-01/\"\
  },\
  \"operations\":{\
    \"DeleteAlarms\":{\
      \"name\":\"DeleteAlarms\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteAlarmsInput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified alarms. In the event of an error, no alarms are deleted.</p>\"\
    },\
    \"DeleteDashboards\":{\
      \"name\":\"DeleteDashboards\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDashboardsInput\"},\
      \"output\":{\
        \"shape\":\"DeleteDashboardsOutput\",\
        \"resultWrapper\":\"DeleteDashboardsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"DashboardNotFoundError\"},\
        {\"shape\":\"InternalServiceFault\"}\
      ],\
      \"documentation\":\"<p>Deletes all dashboards that you specify. You may specify up to 100 dashboards to delete. If there is an error during this call, no dashboards are deleted.</p>\"\
    },\
    \"DescribeAlarmHistory\":{\
      \"name\":\"DescribeAlarmHistory\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAlarmHistoryInput\"},\
      \"output\":{\
        \"shape\":\"DescribeAlarmHistoryOutput\",\
        \"resultWrapper\":\"DescribeAlarmHistoryResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidNextToken\"}\
      ],\
      \"documentation\":\"<p>Retrieves the history for the specified alarm. You can filter the results by date range or item type. If an alarm name is not specified, the histories for all alarms are returned.</p> <p>CloudWatch retains the history of an alarm even if you delete the alarm.</p>\"\
    },\
    \"DescribeAlarms\":{\
      \"name\":\"DescribeAlarms\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAlarmsInput\"},\
      \"output\":{\
        \"shape\":\"DescribeAlarmsOutput\",\
        \"resultWrapper\":\"DescribeAlarmsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidNextToken\"}\
      ],\
      \"documentation\":\"<p>Retrieves the specified alarms. If no alarms are specified, all alarms are returned. Alarms can be retrieved by using only a prefix for the alarm name, the alarm state, or a prefix for any action.</p>\"\
    },\
    \"DescribeAlarmsForMetric\":{\
      \"name\":\"DescribeAlarmsForMetric\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAlarmsForMetricInput\"},\
      \"output\":{\
        \"shape\":\"DescribeAlarmsForMetricOutput\",\
        \"resultWrapper\":\"DescribeAlarmsForMetricResult\"\
      },\
      \"documentation\":\"<p>Retrieves the alarms for the specified metric. To filter the results, specify a statistic, period, or unit.</p>\"\
    },\
    \"DisableAlarmActions\":{\
      \"name\":\"DisableAlarmActions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisableAlarmActionsInput\"},\
      \"documentation\":\"<p>Disables the actions for the specified alarms. When an alarm's actions are disabled, the alarm actions do not execute when the alarm state changes.</p>\"\
    },\
    \"EnableAlarmActions\":{\
      \"name\":\"EnableAlarmActions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EnableAlarmActionsInput\"},\
      \"documentation\":\"<p>Enables the actions for the specified alarms.</p>\"\
    },\
    \"GetDashboard\":{\
      \"name\":\"GetDashboard\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDashboardInput\"},\
      \"output\":{\
        \"shape\":\"GetDashboardOutput\",\
        \"resultWrapper\":\"GetDashboardResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"DashboardNotFoundError\"},\
        {\"shape\":\"InternalServiceFault\"}\
      ],\
      \"documentation\":\"<p>Displays the details of the dashboard that you specify.</p> <p>To copy an existing dashboard, use <code>GetDashboard</code>, and then use the data returned within <code>DashboardBody</code> as the template for the new dashboard when you call <code>PutDashboard</code> to create the copy.</p>\"\
    },\
    \"GetMetricData\":{\
      \"name\":\"GetMetricData\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetMetricDataInput\"},\
      \"output\":{\
        \"shape\":\"GetMetricDataOutput\",\
        \"resultWrapper\":\"GetMetricDataResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidNextToken\"}\
      ],\
      \"documentation\":\"<p>You can use the <code>GetMetricData</code> API to retrieve as many as 100 different metrics in a single request, with a total of as many as 100,800 datapoints. You can also optionally perform math expressions on the values of the returned statistics, to create new time series that represent new insights into your data. For example, using Lambda metrics, you could divide the Errors metric by the Invocations metric to get an error rate time series. For more information about metric math expressions, see <a href=\\\"http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax\\\">Metric Math Syntax and Functions</a> in the <i>Amazon CloudWatch User Guide</i>.</p> <p>Calls to the <code>GetMetricData</code> API have a different pricing structure than calls to <code>GetMetricStatistics</code>. For more information about pricing, see <a href=\\\"https://aws.amazon.com/cloudwatch/pricing/\\\">Amazon CloudWatch Pricing</a>.</p>\"\
    },\
    \"GetMetricStatistics\":{\
      \"name\":\"GetMetricStatistics\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetMetricStatisticsInput\"},\
      \"output\":{\
        \"shape\":\"GetMetricStatisticsOutput\",\
        \"resultWrapper\":\"GetMetricStatisticsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingRequiredParameterException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"},\
        {\"shape\":\"InternalServiceFault\"}\
      ],\
      \"documentation\":\"<p>Gets statistics for the specified metric.</p> <p>The maximum number of data points returned from a single call is 1,440. If you request more than 1,440 data points, CloudWatch returns an error. To reduce the number of data points, you can narrow the specified time range and make multiple requests across adjacent time ranges, or you can increase the specified period. Data points are not returned in chronological order.</p> <p>CloudWatch aggregates data points based on the length of the period that you specify. For example, if you request statistics with a one-hour period, CloudWatch aggregates all data points with time stamps that fall within each one-hour period. Therefore, the number of values aggregated by CloudWatch is larger than the number of data points returned.</p> <p>CloudWatch needs raw data points to calculate percentile statistics. If you publish data using a statistic set instead, you can only retrieve percentile statistics for this data if one of the following conditions is true:</p> <ul> <li> <p>The SampleCount value of the statistic set is 1.</p> </li> <li> <p>The Min and the Max values of the statistic set are equal.</p> </li> </ul> <p>Amazon CloudWatch retains metric data as follows:</p> <ul> <li> <p>Data points with a period of less than 60 seconds are available for 3 hours. These data points are high-resolution metrics and are available only for custom metrics that have been defined with a <code>StorageResolution</code> of 1.</p> </li> <li> <p>Data points with a period of 60 seconds (1-minute) are available for 15 days.</p> </li> <li> <p>Data points with a period of 300 seconds (5-minute) are available for 63 days.</p> </li> <li> <p>Data points with a period of 3600 seconds (1 hour) are available for 455 days (15 months).</p> </li> </ul> <p>Data points that are initially published with a shorter period are aggregated together for long-term storage. For example, if you collect data using a period of 1 minute, the data remains available for 15 days with 1-minute resolution. After 15 days, this data is still available, but is aggregated and retrievable only with a resolution of 5 minutes. After 63 days, the data is further aggregated and is available with a resolution of 1 hour.</p> <p>CloudWatch started retaining 5-minute and 1-hour metric data as of July 9, 2016.</p> <p>For information about metrics and dimensions supported by AWS services, see the <a href=\\\"http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CW_Support_For_AWS.html\\\">Amazon CloudWatch Metrics and Dimensions Reference</a> in the <i>Amazon CloudWatch User Guide</i>.</p>\"\
    },\
    \"ListDashboards\":{\
      \"name\":\"ListDashboards\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListDashboardsInput\"},\
      \"output\":{\
        \"shape\":\"ListDashboardsOutput\",\
        \"resultWrapper\":\"ListDashboardsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"InternalServiceFault\"}\
      ],\
      \"documentation\":\"<p>Returns a list of the dashboards for your account. If you include <code>DashboardNamePrefix</code>, only those dashboards with names starting with the prefix are listed. Otherwise, all dashboards in your account are listed. </p>\"\
    },\
    \"ListMetrics\":{\
      \"name\":\"ListMetrics\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListMetricsInput\"},\
      \"output\":{\
        \"shape\":\"ListMetricsOutput\",\
        \"resultWrapper\":\"ListMetricsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InternalServiceFault\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>List the specified metrics. You can use the returned metrics with <a>GetMetricStatistics</a> to obtain statistical data.</p> <p>Up to 500 results are returned for any one call. To retrieve additional results, use the returned token with subsequent calls.</p> <p>After you create a metric, allow up to fifteen minutes before the metric appears. Statistics about the metric, however, are available sooner using <a>GetMetricStatistics</a>.</p>\"\
    },\
    \"PutDashboard\":{\
      \"name\":\"PutDashboard\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutDashboardInput\"},\
      \"output\":{\
        \"shape\":\"PutDashboardOutput\",\
        \"resultWrapper\":\"PutDashboardResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"DashboardInvalidInputError\"},\
        {\"shape\":\"InternalServiceFault\"}\
      ],\
      \"documentation\":\"<p>Creates a dashboard if it does not already exist, or updates an existing dashboard. If you update a dashboard, the entire contents are replaced with what you specify here.</p> <p>You can have up to 500 dashboards per account. All dashboards in your account are global, not region-specific.</p> <p>A simple way to create a dashboard using <code>PutDashboard</code> is to copy an existing dashboard. To copy an existing dashboard using the console, you can load the dashboard and then use the View/edit source command in the Actions menu to display the JSON block for that dashboard. Another way to copy a dashboard is to use <code>GetDashboard</code>, and then use the data returned within <code>DashboardBody</code> as the template for the new dashboard when you call <code>PutDashboard</code>.</p> <p>When you create a dashboard with <code>PutDashboard</code>, a good practice is to add a text widget at the top of the dashboard with a message that the dashboard was created by script and should not be changed in the console. This message could also point console users to the location of the <code>DashboardBody</code> script or the CloudFormation template used to create the dashboard.</p>\"\
    },\
    \"PutMetricAlarm\":{\
      \"name\":\"PutMetricAlarm\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutMetricAlarmInput\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededFault\"}\
      ],\
      \"documentation\":\"<p>Creates or updates an alarm and associates it with the specified metric. Optionally, this operation can associate one or more Amazon SNS resources with the alarm.</p> <p>When this operation creates an alarm, the alarm state is immediately set to <code>INSUFFICIENT_DATA</code>. The alarm is evaluated and its state is set appropriately. Any actions associated with the state are then executed.</p> <p>When you update an existing alarm, its state is left unchanged, but the update completely overwrites the previous configuration of the alarm.</p> <p>If you are an IAM user, you must have Amazon EC2 permissions for some operations:</p> <ul> <li> <p> <code>iam:CreateServiceLinkedRole</code> for all alarms with EC2 actions</p> </li> <li> <p> <code>ec2:DescribeInstanceStatus</code> and <code>ec2:DescribeInstances</code> for all alarms on EC2 instance status metrics</p> </li> <li> <p> <code>ec2:StopInstances</code> for alarms with stop actions</p> </li> <li> <p> <code>ec2:TerminateInstances</code> for alarms with terminate actions</p> </li> <li> <p> <code>ec2:DescribeInstanceRecoveryAttribute</code> and <code>ec2:RecoverInstances</code> for alarms with recover actions</p> </li> </ul> <p>If you have read/write permissions for Amazon CloudWatch but not for Amazon EC2, you can still create an alarm, but the stop or terminate actions are not performed. However, if you are later granted the required permissions, the alarm actions that you created earlier are performed.</p> <p>If you are using an IAM role (for example, an EC2 instance profile), you cannot stop or terminate the instance using alarm actions. However, you can still see the alarm state and perform any other actions such as Amazon SNS notifications or Auto Scaling policies.</p> <p>If you are using temporary security credentials granted using AWS STS, you cannot stop or terminate an EC2 instance using alarm actions.</p> <p>You must create at least one stop, terminate, or reboot alarm using either the Amazon EC2 or CloudWatch consoles to create the <b>EC2ActionsAccess</b> IAM role. After this IAM role is created, you can create stop, terminate, or reboot alarms using a command-line interface or API.</p>\"\
    },\
    \"PutMetricData\":{\
      \"name\":\"PutMetricData\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutMetricDataInput\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"MissingRequiredParameterException\"},\
        {\"shape\":\"InvalidParameterCombinationException\"},\
        {\"shape\":\"InternalServiceFault\"}\
      ],\
      \"documentation\":\"<p>Publishes metric data points to Amazon CloudWatch. CloudWatch associates the data points with the specified metric. If the specified metric does not exist, CloudWatch creates the metric. When CloudWatch creates a metric, it can take up to fifteen minutes for the metric to appear in calls to <a>ListMetrics</a>.</p> <p>Each <code>PutMetricData</code> request is limited to 40 KB in size for HTTP POST requests.</p> <p>Although the <code>Value</code> parameter accepts numbers of type <code>Double</code>, CloudWatch rejects values that are either too small or too large. Values must be in the range of 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2). In addition, special values (for example, NaN, +Infinity, -Infinity) are not supported.</p> <p>You can use up to 10 dimensions per metric to further clarify what data the metric collects. For more information about specifying dimensions, see <a href=\\\"http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html\\\">Publishing Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p> <p>Data points with time stamps from 24 hours ago or longer can take at least 48 hours to become available for <a>GetMetricStatistics</a> from the time they are submitted.</p> <p>CloudWatch needs raw data points to calculate percentile statistics. If you publish data using a statistic set instead, you can only retrieve percentile statistics for this data if one of the following conditions is true:</p> <ul> <li> <p>The SampleCount value of the statistic set is 1</p> </li> <li> <p>The Min and the Max values of the statistic set are equal</p> </li> </ul>\"\
    },\
    \"SetAlarmState\":{\
      \"name\":\"SetAlarmState\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetAlarmStateInput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFound\"},\
        {\"shape\":\"InvalidFormatFault\"}\
      ],\
      \"documentation\":\"<p>Temporarily sets the state of an alarm for testing purposes. When the updated state differs from the previous value, the action configured for the appropriate state is invoked. For example, if your alarm is configured to send an Amazon SNS message when an alarm is triggered, temporarily changing the alarm state to <code>ALARM</code> sends an SNS message. The alarm returns to its actual state (often within seconds). Because the alarm state change happens quickly, it is typically only visible in the alarm's <b>History</b> tab in the Amazon CloudWatch console or through <a>DescribeAlarmHistory</a>.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"ActionPrefix\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"ActionsEnabled\":{\"type\":\"boolean\"},\
    \"AlarmArn\":{\
      \"type\":\"string\",\
      \"max\":1600,\
      \"min\":1\
    },\
    \"AlarmDescription\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"AlarmHistoryItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AlarmName\":{\
          \"shape\":\"AlarmName\",\
          \"documentation\":\"<p>The descriptive name for the alarm.</p>\"\
        },\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time stamp for the alarm history item.</p>\"\
        },\
        \"HistoryItemType\":{\
          \"shape\":\"HistoryItemType\",\
          \"documentation\":\"<p>The type of alarm history item.</p>\"\
        },\
        \"HistorySummary\":{\
          \"shape\":\"HistorySummary\",\
          \"documentation\":\"<p>A summary of the alarm history, in text format.</p>\"\
        },\
        \"HistoryData\":{\
          \"shape\":\"HistoryData\",\
          \"documentation\":\"<p>Data about the alarm, in JSON format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the history of a specific alarm.</p>\"\
    },\
    \"AlarmHistoryItems\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AlarmHistoryItem\"}\
    },\
    \"AlarmName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"AlarmNamePrefix\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"AlarmNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AlarmName\"},\
      \"max\":100\
    },\
    \"AwsQueryErrorMessage\":{\"type\":\"string\"},\
    \"ComparisonOperator\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"GreaterThanOrEqualToThreshold\",\
        \"GreaterThanThreshold\",\
        \"LessThanThreshold\",\
        \"LessThanOrEqualToThreshold\"\
      ]\
    },\
    \"DashboardArn\":{\"type\":\"string\"},\
    \"DashboardBody\":{\"type\":\"string\"},\
    \"DashboardEntries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DashboardEntry\"}\
    },\
    \"DashboardEntry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DashboardName\":{\
          \"shape\":\"DashboardName\",\
          \"documentation\":\"<p>The name of the dashboard.</p>\"\
        },\
        \"DashboardArn\":{\
          \"shape\":\"DashboardArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dashboard.</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"LastModified\",\
          \"documentation\":\"<p>The time stamp of when the dashboard was last modified, either by an API call or through the console. This number is expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC.</p>\"\
        },\
        \"Size\":{\
          \"shape\":\"Size\",\
          \"documentation\":\"<p>The size of the dashboard, in bytes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a specific dashboard.</p>\"\
    },\
    \"DashboardErrorMessage\":{\"type\":\"string\"},\
    \"DashboardInvalidInputError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"DashboardErrorMessage\"},\
        \"dashboardValidationMessages\":{\"shape\":\"DashboardValidationMessages\"}\
      },\
      \"documentation\":\"<p>Some part of the dashboard data is invalid.</p>\",\
      \"error\":{\
        \"code\":\"InvalidParameterInput\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"DashboardName\":{\"type\":\"string\"},\
    \"DashboardNamePrefix\":{\"type\":\"string\"},\
    \"DashboardNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DashboardName\"}\
    },\
    \"DashboardNotFoundError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"DashboardErrorMessage\"}\
      },\
      \"documentation\":\"<p>The specified dashboard does not exist.</p>\",\
      \"error\":{\
        \"code\":\"ResourceNotFound\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"DashboardValidationMessage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DataPath\":{\
          \"shape\":\"DataPath\",\
          \"documentation\":\"<p>The data path related to the message.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>A message describing the error or warning.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An error or warning for the operation.</p>\"\
    },\
    \"DashboardValidationMessages\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DashboardValidationMessage\"}\
    },\
    \"DataPath\":{\"type\":\"string\"},\
    \"Datapoint\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time stamp used for the data point.</p>\"\
        },\
        \"SampleCount\":{\
          \"shape\":\"DatapointValue\",\
          \"documentation\":\"<p>The number of metric values that contributed to the aggregate value of this data point.</p>\"\
        },\
        \"Average\":{\
          \"shape\":\"DatapointValue\",\
          \"documentation\":\"<p>The average of the metric values that correspond to the data point.</p>\"\
        },\
        \"Sum\":{\
          \"shape\":\"DatapointValue\",\
          \"documentation\":\"<p>The sum of the metric values for the data point.</p>\"\
        },\
        \"Minimum\":{\
          \"shape\":\"DatapointValue\",\
          \"documentation\":\"<p>The minimum metric value for the data point.</p>\"\
        },\
        \"Maximum\":{\
          \"shape\":\"DatapointValue\",\
          \"documentation\":\"<p>The maximum metric value for the data point.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"StandardUnit\",\
          \"documentation\":\"<p>The standard unit for the data point.</p>\"\
        },\
        \"ExtendedStatistics\":{\
          \"shape\":\"DatapointValueMap\",\
          \"documentation\":\"<p>The percentile statistic for the data point.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Encapsulates the statistical data that CloudWatch computes from metric data.</p>\",\
      \"xmlOrder\":[\
        \"Timestamp\",\
        \"SampleCount\",\
        \"Average\",\
        \"Sum\",\
        \"Minimum\",\
        \"Maximum\",\
        \"Unit\",\
        \"ExtendedStatistics\"\
      ]\
    },\
    \"DatapointValue\":{\"type\":\"double\"},\
    \"DatapointValueMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ExtendedStatistic\"},\
      \"value\":{\"shape\":\"DatapointValue\"}\
    },\
    \"DatapointValues\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DatapointValue\"}\
    },\
    \"Datapoints\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Datapoint\"}\
    },\
    \"DatapointsToAlarm\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"DeleteAlarmsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"AlarmNames\"],\
      \"members\":{\
        \"AlarmNames\":{\
          \"shape\":\"AlarmNames\",\
          \"documentation\":\"<p>The alarms to be deleted.</p>\"\
        }\
      }\
    },\
    \"DeleteDashboardsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"DashboardNames\"],\
      \"members\":{\
        \"DashboardNames\":{\
          \"shape\":\"DashboardNames\",\
          \"documentation\":\"<p>The dashboards to be deleted. This parameter is required.</p>\"\
        }\
      }\
    },\
    \"DeleteDashboardsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeAlarmHistoryInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AlarmName\":{\
          \"shape\":\"AlarmName\",\
          \"documentation\":\"<p>The name of the alarm.</p>\"\
        },\
        \"HistoryItemType\":{\
          \"shape\":\"HistoryItemType\",\
          \"documentation\":\"<p>The type of alarm histories to retrieve.</p>\"\
        },\
        \"StartDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The starting date to retrieve alarm history.</p>\"\
        },\
        \"EndDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The ending date to retrieve alarm history.</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of alarm history records to retrieve.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token returned by a previous call to indicate that there is more data available.</p>\"\
        }\
      }\
    },\
    \"DescribeAlarmHistoryOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AlarmHistoryItems\":{\
          \"shape\":\"AlarmHistoryItems\",\
          \"documentation\":\"<p>The alarm histories, in JSON format.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token that marks the start of the next batch of returned results.</p>\"\
        }\
      }\
    },\
    \"DescribeAlarmsForMetricInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MetricName\",\
        \"Namespace\"\
      ],\
      \"members\":{\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric.</p>\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace of the metric.</p>\"\
        },\
        \"Statistic\":{\
          \"shape\":\"Statistic\",\
          \"documentation\":\"<p>The statistic for the metric, other than percentiles. For percentile statistics, use <code>ExtendedStatistics</code>.</p>\"\
        },\
        \"ExtendedStatistic\":{\
          \"shape\":\"ExtendedStatistic\",\
          \"documentation\":\"<p>The percentile statistic for the metric. Specify a value between p0.0 and p100.</p>\"\
        },\
        \"Dimensions\":{\
          \"shape\":\"Dimensions\",\
          \"documentation\":\"<p>The dimensions associated with the metric. If the metric has any associated dimensions, you must specify them in order for the call to succeed.</p>\"\
        },\
        \"Period\":{\
          \"shape\":\"Period\",\
          \"documentation\":\"<p>The period, in seconds, over which the statistic is applied.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"StandardUnit\",\
          \"documentation\":\"<p>The unit for the metric.</p>\"\
        }\
      }\
    },\
    \"DescribeAlarmsForMetricOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MetricAlarms\":{\
          \"shape\":\"MetricAlarms\",\
          \"documentation\":\"<p>The information for each alarm with the specified metric.</p>\"\
        }\
      }\
    },\
    \"DescribeAlarmsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AlarmNames\":{\
          \"shape\":\"AlarmNames\",\
          \"documentation\":\"<p>The names of the alarms.</p>\"\
        },\
        \"AlarmNamePrefix\":{\
          \"shape\":\"AlarmNamePrefix\",\
          \"documentation\":\"<p>The alarm name prefix. If this parameter is specified, you cannot specify <code>AlarmNames</code>.</p>\"\
        },\
        \"StateValue\":{\
          \"shape\":\"StateValue\",\
          \"documentation\":\"<p>The state value to be used in matching alarms.</p>\"\
        },\
        \"ActionPrefix\":{\
          \"shape\":\"ActionPrefix\",\
          \"documentation\":\"<p>The action name prefix.</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of alarm descriptions to retrieve.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token returned by a previous call to indicate that there is more data available.</p>\"\
        }\
      }\
    },\
    \"DescribeAlarmsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MetricAlarms\":{\
          \"shape\":\"MetricAlarms\",\
          \"documentation\":\"<p>The information for the specified alarms.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token that marks the start of the next batch of returned results.</p>\"\
        }\
      }\
    },\
    \"Dimension\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"DimensionName\",\
          \"documentation\":\"<p>The name of the dimension.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"DimensionValue\",\
          \"documentation\":\"<p>The value representing the dimension measurement.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Expands the identity of a metric.</p>\",\
      \"xmlOrder\":[\
        \"Name\",\
        \"Value\"\
      ]\
    },\
    \"DimensionFilter\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"DimensionName\",\
          \"documentation\":\"<p>The dimension name to be matched.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"DimensionValue\",\
          \"documentation\":\"<p>The value of the dimension to be matched.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents filters for a dimension.</p>\"\
    },\
    \"DimensionFilters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DimensionFilter\"},\
      \"max\":10\
    },\
    \"DimensionName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"DimensionValue\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"Dimensions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Dimension\"},\
      \"max\":10\
    },\
    \"DisableAlarmActionsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"AlarmNames\"],\
      \"members\":{\
        \"AlarmNames\":{\
          \"shape\":\"AlarmNames\",\
          \"documentation\":\"<p>The names of the alarms.</p>\"\
        }\
      }\
    },\
    \"EnableAlarmActionsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"AlarmNames\"],\
      \"members\":{\
        \"AlarmNames\":{\
          \"shape\":\"AlarmNames\",\
          \"documentation\":\"<p>The names of the alarms.</p>\"\
        }\
      }\
    },\
    \"ErrorMessage\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"EvaluateLowSampleCountPercentile\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"EvaluationPeriods\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"ExtendedStatistic\":{\
      \"type\":\"string\",\
      \"pattern\":\"p(\\\\d{1,2}(\\\\.\\\\d{0,2})?|100)\"\
    },\
    \"ExtendedStatistics\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ExtendedStatistic\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"FaultDescription\":{\"type\":\"string\"},\
    \"GetDashboardInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"DashboardName\"],\
      \"members\":{\
        \"DashboardName\":{\
          \"shape\":\"DashboardName\",\
          \"documentation\":\"<p>The name of the dashboard to be described.</p>\"\
        }\
      }\
    },\
    \"GetDashboardOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DashboardArn\":{\
          \"shape\":\"DashboardArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dashboard.</p>\"\
        },\
        \"DashboardBody\":{\
          \"shape\":\"DashboardBody\",\
          \"documentation\":\"<p>The detailed information about the dashboard, including what widgets are included and their location on the dashboard. For more information about the <code>DashboardBody</code> syntax, see <a>CloudWatch-Dashboard-Body-Structure</a>. </p>\"\
        },\
        \"DashboardName\":{\
          \"shape\":\"DashboardName\",\
          \"documentation\":\"<p>The name of the dashboard.</p>\"\
        }\
      }\
    },\
    \"GetMetricDataInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MetricDataQueries\",\
        \"StartTime\",\
        \"EndTime\"\
      ],\
      \"members\":{\
        \"MetricDataQueries\":{\
          \"shape\":\"MetricDataQueries\",\
          \"documentation\":\"<p>The metric queries to be returned. A single <code>GetMetricData</code> call can include as many as 100 <code>MetricDataQuery</code> structures. Each of these structures can specify either a metric to retrieve, or a math expression to perform on retrieved data. </p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time stamp indicating the earliest data to be returned.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time stamp indicating the latest data to be returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>Include this value, if it was returned by the previous call, to get the next set of data points.</p>\"\
        },\
        \"ScanBy\":{\
          \"shape\":\"ScanBy\",\
          \"documentation\":\"<p>The order in which data points should be returned. <code>TimestampDescending</code> returns the newest data first and paginates when the <code>MaxDatapoints</code> limit is reached. <code>TimestampAscending</code> returns the oldest data first and paginates when the <code>MaxDatapoints</code> limit is reached.</p>\"\
        },\
        \"MaxDatapoints\":{\
          \"shape\":\"GetMetricDataMaxDatapoints\",\
          \"documentation\":\"<p>The maximum number of data points the request should return before paginating. If you omit this, the default of 100,800 is used.</p>\"\
        }\
      }\
    },\
    \"GetMetricDataMaxDatapoints\":{\"type\":\"integer\"},\
    \"GetMetricDataOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MetricDataResults\":{\
          \"shape\":\"MetricDataResults\",\
          \"documentation\":\"<p>The metrics that are returned, including the metric name, namespace, and dimensions.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that marks the next batch of returned results.</p>\"\
        }\
      }\
    },\
    \"GetMetricStatisticsInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Namespace\",\
        \"MetricName\",\
        \"StartTime\",\
        \"EndTime\",\
        \"Period\"\
      ],\
      \"members\":{\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace of the metric, with or without spaces.</p>\"\
        },\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric, with or without spaces.</p>\"\
        },\
        \"Dimensions\":{\
          \"shape\":\"Dimensions\",\
          \"documentation\":\"<p>The dimensions. If the metric contains multiple dimensions, you must include a value for each dimension. CloudWatch treats each unique combination of dimensions as a separate metric. If a specific combination of dimensions was not published, you can't retrieve statistics for it. You must specify the same dimensions that were used when the metrics were created. For an example, see <a href=\\\"http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#dimension-combinations\\\">Dimension Combinations</a> in the <i>Amazon CloudWatch User Guide</i>. For more information about specifying dimensions, see <a href=\\\"http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html\\\">Publishing Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time stamp that determines the first data point to return. Start times are evaluated relative to the time that CloudWatch receives the request.</p> <p>The value specified is inclusive; results include data points with the specified time stamp. The time stamp must be in ISO 8601 UTC format (for example, 2016-10-03T23:00:00Z).</p> <p>CloudWatch rounds the specified time stamp as follows:</p> <ul> <li> <p>Start time less than 15 days ago - Round down to the nearest whole minute. For example, 12:32:34 is rounded down to 12:32:00.</p> </li> <li> <p>Start time between 15 and 63 days ago - Round down to the nearest 5-minute clock interval. For example, 12:32:34 is rounded down to 12:30:00.</p> </li> <li> <p>Start time greater than 63 days ago - Round down to the nearest 1-hour clock interval. For example, 12:32:34 is rounded down to 12:00:00.</p> </li> </ul> <p>If you set <code>Period</code> to 5, 10, or 30, the start time of your request is rounded down to the nearest time that corresponds to even 5-, 10-, or 30-second divisions of a minute. For example, if you make a query at (HH:mm:ss) 01:05:23 for the previous 10-second period, the start time of your request is rounded down and you receive data from 01:05:10 to 01:05:20. If you make a query at 15:07:17 for the previous 5 minutes of data, using a period of 5 seconds, you receive data timestamped between 15:02:15 and 15:07:15. </p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time stamp that determines the last data point to return.</p> <p>The value specified is exclusive; results include data points up to the specified time stamp. The time stamp must be in ISO 8601 UTC format (for example, 2016-10-10T23:00:00Z).</p>\"\
        },\
        \"Period\":{\
          \"shape\":\"Period\",\
          \"documentation\":\"<p>The granularity, in seconds, of the returned data points. For metrics with regular resolution, a period can be as short as one minute (60 seconds) and must be a multiple of 60. For high-resolution metrics that are collected at intervals of less than one minute, the period can be 1, 5, 10, 30, 60, or any multiple of 60. High-resolution metrics are those metrics stored by a <code>PutMetricData</code> call that includes a <code>StorageResolution</code> of 1 second.</p> <p>If the <code>StartTime</code> parameter specifies a time stamp that is greater than 3 hours ago, you must specify the period as follows or no data points in that time range is returned:</p> <ul> <li> <p>Start time between 3 hours and 15 days ago - Use a multiple of 60 seconds (1 minute).</p> </li> <li> <p>Start time between 15 and 63 days ago - Use a multiple of 300 seconds (5 minutes).</p> </li> <li> <p>Start time greater than 63 days ago - Use a multiple of 3600 seconds (1 hour).</p> </li> </ul>\"\
        },\
        \"Statistics\":{\
          \"shape\":\"Statistics\",\
          \"documentation\":\"<p>The metric statistics, other than percentile. For percentile statistics, use <code>ExtendedStatistics</code>. When calling <code>GetMetricStatistics</code>, you must specify either <code>Statistics</code> or <code>ExtendedStatistics</code>, but not both.</p>\"\
        },\
        \"ExtendedStatistics\":{\
          \"shape\":\"ExtendedStatistics\",\
          \"documentation\":\"<p>The percentile statistics. Specify values between p0.0 and p100. When calling <code>GetMetricStatistics</code>, you must specify either <code>Statistics</code> or <code>ExtendedStatistics</code>, but not both.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"StandardUnit\",\
          \"documentation\":\"<p>The unit for a given metric. Metrics may be reported in multiple units. Not supplying a unit results in all units being returned. If you specify only a unit that the metric does not report, the results of the call are null.</p>\"\
        }\
      }\
    },\
    \"GetMetricStatisticsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Label\":{\
          \"shape\":\"MetricLabel\",\
          \"documentation\":\"<p>A label for the specified metric.</p>\"\
        },\
        \"Datapoints\":{\
          \"shape\":\"Datapoints\",\
          \"documentation\":\"<p>The data points for the specified metric.</p>\"\
        }\
      }\
    },\
    \"HistoryData\":{\
      \"type\":\"string\",\
      \"max\":4095,\
      \"min\":1\
    },\
    \"HistoryItemType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ConfigurationUpdate\",\
        \"StateUpdate\",\
        \"Action\"\
      ]\
    },\
    \"HistorySummary\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"InternalServiceFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"FaultDescription\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>Request processing has failed due to some unknown error, exception, or failure.</p>\",\
      \"error\":{\
        \"code\":\"InternalServiceError\",\
        \"httpStatusCode\":500\
      },\
      \"exception\":true,\
      \"xmlOrder\":[\"Message\"]\
    },\
    \"InvalidFormatFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>Data was not syntactically valid JSON.</p>\",\
      \"error\":{\
        \"code\":\"InvalidFormat\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidNextToken\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>The next token specified is invalid.</p>\",\
      \"error\":{\
        \"code\":\"InvalidNextToken\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidParameterCombinationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"AwsQueryErrorMessage\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>Parameters were used together that cannot be used together.</p>\",\
      \"error\":{\
        \"code\":\"InvalidParameterCombination\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InvalidParameterValueException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"AwsQueryErrorMessage\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>The value of an input parameter is bad or out-of-range.</p>\",\
      \"error\":{\
        \"code\":\"InvalidParameterValue\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"LastModified\":{\"type\":\"timestamp\"},\
    \"LimitExceededFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>The quota for alarms for this customer has already been reached.</p>\",\
      \"error\":{\
        \"code\":\"LimitExceeded\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ListDashboardsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DashboardNamePrefix\":{\
          \"shape\":\"DashboardNamePrefix\",\
          \"documentation\":\"<p>If you specify this parameter, only the dashboards with names starting with the specified string are listed. The maximum length is 255, and valid characters are A-Z, a-z, 0-9, \\\".\\\", \\\"-\\\", and \\\"_\\\". </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token returned by a previous call to indicate that there is more data available.</p>\"\
        }\
      }\
    },\
    \"ListDashboardsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DashboardEntries\":{\
          \"shape\":\"DashboardEntries\",\
          \"documentation\":\"<p>The list of matching dashboards.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token that marks the start of the next batch of returned results.</p>\"\
        }\
      }\
    },\
    \"ListMetricsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace to filter against.</p>\"\
        },\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric to filter against.</p>\"\
        },\
        \"Dimensions\":{\
          \"shape\":\"DimensionFilters\",\
          \"documentation\":\"<p>The dimensions to filter against.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token returned by a previous call to indicate that there is more data available.</p>\"\
        }\
      }\
    },\
    \"ListMetricsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Metrics\":{\
          \"shape\":\"Metrics\",\
          \"documentation\":\"<p>The metrics.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token that marks the start of the next batch of returned results.</p>\"\
        }\
      },\
      \"xmlOrder\":[\
        \"Metrics\",\
        \"NextToken\"\
      ]\
    },\
    \"MaxRecords\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"Message\":{\"type\":\"string\"},\
    \"MessageData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"MessageDataCode\",\
          \"documentation\":\"<p>The error code or status code associated with the message.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"MessageDataValue\",\
          \"documentation\":\"<p>The message text.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A message returned by the <code>GetMetricData</code>API, including a code and a description.</p>\"\
    },\
    \"MessageDataCode\":{\"type\":\"string\"},\
    \"MessageDataValue\":{\"type\":\"string\"},\
    \"Metric\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace of the metric.</p>\"\
        },\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric.</p>\"\
        },\
        \"Dimensions\":{\
          \"shape\":\"Dimensions\",\
          \"documentation\":\"<p>The dimensions for the metric.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a specific metric.</p>\",\
      \"xmlOrder\":[\
        \"Namespace\",\
        \"MetricName\",\
        \"Dimensions\"\
      ]\
    },\
    \"MetricAlarm\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AlarmName\":{\
          \"shape\":\"AlarmName\",\
          \"documentation\":\"<p>The name of the alarm.</p>\"\
        },\
        \"AlarmArn\":{\
          \"shape\":\"AlarmArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the alarm.</p>\"\
        },\
        \"AlarmDescription\":{\
          \"shape\":\"AlarmDescription\",\
          \"documentation\":\"<p>The description of the alarm.</p>\"\
        },\
        \"AlarmConfigurationUpdatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time stamp of the last update to the alarm configuration.</p>\"\
        },\
        \"ActionsEnabled\":{\
          \"shape\":\"ActionsEnabled\",\
          \"documentation\":\"<p>Indicates whether actions should be executed during any changes to the alarm state.</p>\"\
        },\
        \"OKActions\":{\
          \"shape\":\"ResourceList\",\
          \"documentation\":\"<p>The actions to execute when this alarm transitions to the <code>OK</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN).</p>\"\
        },\
        \"AlarmActions\":{\
          \"shape\":\"ResourceList\",\
          \"documentation\":\"<p>The actions to execute when this alarm transitions to the <code>ALARM</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN).</p>\"\
        },\
        \"InsufficientDataActions\":{\
          \"shape\":\"ResourceList\",\
          \"documentation\":\"<p>The actions to execute when this alarm transitions to the <code>INSUFFICIENT_DATA</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN).</p>\"\
        },\
        \"StateValue\":{\
          \"shape\":\"StateValue\",\
          \"documentation\":\"<p>The state value for the alarm.</p>\"\
        },\
        \"StateReason\":{\
          \"shape\":\"StateReason\",\
          \"documentation\":\"<p>An explanation for the alarm state, in text format.</p>\"\
        },\
        \"StateReasonData\":{\
          \"shape\":\"StateReasonData\",\
          \"documentation\":\"<p>An explanation for the alarm state, in JSON format.</p>\"\
        },\
        \"StateUpdatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time stamp of the last update to the alarm state.</p>\"\
        },\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric associated with the alarm.</p>\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace of the metric associated with the alarm.</p>\"\
        },\
        \"Statistic\":{\
          \"shape\":\"Statistic\",\
          \"documentation\":\"<p>The statistic for the metric associated with the alarm, other than percentile. For percentile statistics, use <code>ExtendedStatistic</code>.</p>\"\
        },\
        \"ExtendedStatistic\":{\
          \"shape\":\"ExtendedStatistic\",\
          \"documentation\":\"<p>The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100.</p>\"\
        },\
        \"Dimensions\":{\
          \"shape\":\"Dimensions\",\
          \"documentation\":\"<p>The dimensions for the metric associated with the alarm.</p>\"\
        },\
        \"Period\":{\
          \"shape\":\"Period\",\
          \"documentation\":\"<p>The period, in seconds, over which the statistic is applied.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"StandardUnit\",\
          \"documentation\":\"<p>The unit of the metric associated with the alarm.</p>\"\
        },\
        \"EvaluationPeriods\":{\
          \"shape\":\"EvaluationPeriods\",\
          \"documentation\":\"<p>The number of periods over which data is compared to the specified threshold.</p>\"\
        },\
        \"DatapointsToAlarm\":{\
          \"shape\":\"DatapointsToAlarm\",\
          \"documentation\":\"<p>The number of datapoints that must be breaching to trigger the alarm.</p>\"\
        },\
        \"Threshold\":{\
          \"shape\":\"Threshold\",\
          \"documentation\":\"<p>The value to compare with the specified statistic.</p>\"\
        },\
        \"ComparisonOperator\":{\
          \"shape\":\"ComparisonOperator\",\
          \"documentation\":\"<p>The arithmetic operation to use when comparing the specified statistic and threshold. The specified statistic value is used as the first operand.</p>\"\
        },\
        \"TreatMissingData\":{\
          \"shape\":\"TreatMissingData\",\
          \"documentation\":\"<p>Sets how this alarm is to handle missing data points. If this parameter is omitted, the default behavior of <code>missing</code> is used.</p>\"\
        },\
        \"EvaluateLowSampleCountPercentile\":{\
          \"shape\":\"EvaluateLowSampleCountPercentile\",\
          \"documentation\":\"<p>Used only for alarms based on percentiles. If <code>ignore</code>, the alarm state does not change during periods with too few data points to be statistically significant. If <code>evaluate</code> or this parameter is not used, the alarm is always evaluated and possibly changes state no matter how many data points are available.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents an alarm.</p>\",\
      \"xmlOrder\":[\
        \"AlarmName\",\
        \"AlarmArn\",\
        \"AlarmDescription\",\
        \"AlarmConfigurationUpdatedTimestamp\",\
        \"ActionsEnabled\",\
        \"OKActions\",\
        \"AlarmActions\",\
        \"InsufficientDataActions\",\
        \"StateValue\",\
        \"StateReason\",\
        \"StateReasonData\",\
        \"StateUpdatedTimestamp\",\
        \"MetricName\",\
        \"Namespace\",\
        \"Statistic\",\
        \"Dimensions\",\
        \"Period\",\
        \"Unit\",\
        \"EvaluationPeriods\",\
        \"Threshold\",\
        \"ComparisonOperator\",\
        \"ExtendedStatistic\",\
        \"TreatMissingData\",\
        \"EvaluateLowSampleCountPercentile\",\
        \"DatapointsToAlarm\"\
      ]\
    },\
    \"MetricAlarms\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricAlarm\"}\
    },\
    \"MetricData\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricDatum\"}\
    },\
    \"MetricDataQueries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricDataQuery\"}\
    },\
    \"MetricDataQuery\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"MetricId\",\
          \"documentation\":\"<p>A short name used to tie this structure to the results in the response. This name must be unique within a single call to <code>GetMetricData</code>. If you are performing math expressions on this set of data, this name represents that data and can serve as a variable in the mathematical expression. The valid characters are letters, numbers, and underscore. The first character must be a lowercase letter.</p>\"\
        },\
        \"MetricStat\":{\
          \"shape\":\"MetricStat\",\
          \"documentation\":\"<p>The metric to be returned, along with statistics, period, and units. Use this parameter only if this structure is performing a data retrieval and not performing a math expression on the returned data.</p> <p>Within one MetricDataQuery structure, you must specify either <code>Expression</code> or <code>MetricStat</code> but not both.</p>\"\
        },\
        \"Expression\":{\
          \"shape\":\"MetricExpression\",\
          \"documentation\":\"<p>The math expression to be performed on the returned data, if this structure is performing a math expression. For more information about metric math expressions, see <a href=\\\"http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax\\\">Metric Math Syntax and Functions</a> in the <i>Amazon CloudWatch User Guide</i>.</p> <p>Within one MetricDataQuery structure, you must specify either <code>Expression</code> or <code>MetricStat</code> but not both.</p>\"\
        },\
        \"Label\":{\
          \"shape\":\"MetricLabel\",\
          \"documentation\":\"<p>A human-readable label for this metric or expression. This is especially useful if this is an expression, so that you know what the value represents. If the metric or expression is shown in a CloudWatch dashboard widget, the label is shown. If Label is omitted, CloudWatch generates a default.</p>\"\
        },\
        \"ReturnData\":{\
          \"shape\":\"ReturnData\",\
          \"documentation\":\"<p>Indicates whether to return the time stamps and raw data values of this metric. If you are performing this call just to do math expressions and do not also need the raw data returned, you can specify <code>False</code>. If you omit this, the default of <code>True</code> is used.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure indicates the metric data to return, and whether this call is just retrieving a batch set of data for one metric, or is performing a math expression on metric data. A single <code>GetMetricData</code> call can include up to 100 <code>MetricDataQuery</code> structures.</p>\"\
    },\
    \"MetricDataResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"MetricId\",\
          \"documentation\":\"<p>The short name you specified to represent this metric.</p>\"\
        },\
        \"Label\":{\
          \"shape\":\"MetricLabel\",\
          \"documentation\":\"<p>The human-readable label associated with the data.</p>\"\
        },\
        \"Timestamps\":{\
          \"shape\":\"Timestamps\",\
          \"documentation\":\"<p>The time stamps for the data points, formatted in Unix timestamp format. The number of time stamps always matches the number of values and the value for Timestamps[x] is Values[x].</p>\"\
        },\
        \"Values\":{\
          \"shape\":\"DatapointValues\",\
          \"documentation\":\"<p>The data points for the metric corresponding to <code>Timestamps</code>. The number of values always matches the number of time stamps and the time stamp for Values[x] is Timestamps[x].</p>\"\
        },\
        \"StatusCode\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p>The status of the returned data. <code>Complete</code> indicates that all data points in the requested time range were returned. <code>PartialData</code> means that an incomplete set of data points were returned. You can use the <code>NextToken</code> value that was returned and repeat your request to get more data points. <code>NextToken</code> is not returned if you are performing a math expression. <code>InternalError</code> indicates that an error occurred. Retry your request using <code>NextToken</code>, if present.</p>\"\
        },\
        \"Messages\":{\
          \"shape\":\"MetricDataResultMessages\",\
          \"documentation\":\"<p>A list of messages with additional information about the data returned.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A <code>GetMetricData</code> call returns an array of <code>MetricDataResult</code> structures. Each of these structures includes the data points for that metric, along with the time stamps of those data points and other identifying information.</p>\"\
    },\
    \"MetricDataResultMessages\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MessageData\"}\
    },\
    \"MetricDataResults\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricDataResult\"}\
    },\
    \"MetricDatum\":{\
      \"type\":\"structure\",\
      \"required\":[\"MetricName\"],\
      \"members\":{\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric.</p>\"\
        },\
        \"Dimensions\":{\
          \"shape\":\"Dimensions\",\
          \"documentation\":\"<p>The dimensions associated with the metric.</p>\"\
        },\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the metric data was received, expressed as the number of milliseconds since Jan 1, 1970 00:00:00 UTC.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"DatapointValue\",\
          \"documentation\":\"<p>The value for the metric.</p> <p>Although the parameter accepts numbers of type Double, CloudWatch rejects values that are either too small or too large. Values must be in the range of 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2). In addition, special values (for example, NaN, +Infinity, -Infinity) are not supported.</p>\"\
        },\
        \"StatisticValues\":{\
          \"shape\":\"StatisticSet\",\
          \"documentation\":\"<p>The statistical values for the metric.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"StandardUnit\",\
          \"documentation\":\"<p>The unit of the metric.</p>\"\
        },\
        \"StorageResolution\":{\
          \"shape\":\"StorageResolution\",\
          \"documentation\":\"<p>Valid values are 1 and 60. Setting this to 1 specifies this metric as a high-resolution metric, so that CloudWatch stores the metric with sub-minute resolution down to one second. Setting this to 60 specifies this metric as a regular-resolution metric, which CloudWatch stores at 1-minute resolution. Currently, high resolution is available only for custom metrics. For more information about high-resolution metrics, see <a href=\\\"http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html#high-resolution-metrics\\\">High-Resolution Metrics</a> in the <i>Amazon CloudWatch User Guide</i>. </p> <p>This field is optional, if you do not specify it the default of 60 is used.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Encapsulates the information sent to either create a metric or add new values to be aggregated into an existing metric.</p>\"\
    },\
    \"MetricExpression\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"MetricId\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"MetricLabel\":{\"type\":\"string\"},\
    \"MetricName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"MetricStat\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Metric\",\
        \"Period\",\
        \"Stat\"\
      ],\
      \"members\":{\
        \"Metric\":{\
          \"shape\":\"Metric\",\
          \"documentation\":\"<p>The metric to return, including the metric name, namespace, and dimensions.</p>\"\
        },\
        \"Period\":{\
          \"shape\":\"Period\",\
          \"documentation\":\"<p>The period to use when retrieving the metric.</p>\"\
        },\
        \"Stat\":{\
          \"shape\":\"Stat\",\
          \"documentation\":\"<p>The statistic to return. It can include any CloudWatch statistic or extended statistic.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"StandardUnit\",\
          \"documentation\":\"<p>The unit to use for the returned data points.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure defines the metric to be returned, along with the statistics, period, and units.</p>\"\
    },\
    \"Metrics\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Metric\"}\
    },\
    \"MissingRequiredParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"AwsQueryErrorMessage\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>An input parameter that is required is missing.</p>\",\
      \"error\":{\
        \"code\":\"MissingParameter\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Namespace\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"[^:].*\"\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"Period\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"PutDashboardInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DashboardName\",\
        \"DashboardBody\"\
      ],\
      \"members\":{\
        \"DashboardName\":{\
          \"shape\":\"DashboardName\",\
          \"documentation\":\"<p>The name of the dashboard. If a dashboard with this name already exists, this call modifies that dashboard, replacing its current contents. Otherwise, a new dashboard is created. The maximum length is 255, and valid characters are A-Z, a-z, 0-9, \\\"-\\\", and \\\"_\\\". This parameter is required.</p>\"\
        },\
        \"DashboardBody\":{\
          \"shape\":\"DashboardBody\",\
          \"documentation\":\"<p>The detailed information about the dashboard in JSON format, including the widgets to include and their location on the dashboard. This parameter is required.</p> <p>For more information about the syntax, see <a>CloudWatch-Dashboard-Body-Structure</a>.</p>\"\
        }\
      }\
    },\
    \"PutDashboardOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DashboardValidationMessages\":{\
          \"shape\":\"DashboardValidationMessages\",\
          \"documentation\":\"<p>If the input for <code>PutDashboard</code> was correct and the dashboard was successfully created or modified, this result is empty.</p> <p>If this result includes only warning messages, then the input was valid enough for the dashboard to be created or modified, but some elements of the dashboard may not render.</p> <p>If this result includes error messages, the input was not valid and the operation failed.</p>\"\
        }\
      }\
    },\
    \"PutMetricAlarmInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AlarmName\",\
        \"MetricName\",\
        \"Namespace\",\
        \"Period\",\
        \"EvaluationPeriods\",\
        \"Threshold\",\
        \"ComparisonOperator\"\
      ],\
      \"members\":{\
        \"AlarmName\":{\
          \"shape\":\"AlarmName\",\
          \"documentation\":\"<p>The name for the alarm. This name must be unique within the AWS account.</p>\"\
        },\
        \"AlarmDescription\":{\
          \"shape\":\"AlarmDescription\",\
          \"documentation\":\"<p>The description for the alarm.</p>\"\
        },\
        \"ActionsEnabled\":{\
          \"shape\":\"ActionsEnabled\",\
          \"documentation\":\"<p>Indicates whether actions should be executed during any changes to the alarm state.</p>\"\
        },\
        \"OKActions\":{\
          \"shape\":\"ResourceList\",\
          \"documentation\":\"<p>The actions to execute when this alarm transitions to an <code>OK</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN).</p> <p>Valid Values: arn:aws:automate:<i>region</i>:ec2:stop | arn:aws:automate:<i>region</i>:ec2:terminate | arn:aws:automate:<i>region</i>:ec2:recover | arn:aws:sns:<i>region</i>:<i>account-id</i>:<i>sns-topic-name</i> | arn:aws:autoscaling:<i>region</i>:<i>account-id</i>:scalingPolicy:<i>policy-id</i> autoScalingGroupName/<i>group-friendly-name</i>:policyName/<i>policy-friendly-name</i> </p> <p>Valid Values (for use with IAM roles): arn:aws:swf:<i>region</i>:{<i>account-id</i>}:action/actions/AWS_EC2.InstanceId.Stop/1.0 | arn:aws:swf:<i>region</i>:{<i>account-id</i>}:action/actions/AWS_EC2.InstanceId.Terminate/1.0 | arn:aws:swf:<i>region</i>:{<i>account-id</i>}:action/actions/AWS_EC2.InstanceId.Reboot/1.0</p>\"\
        },\
        \"AlarmActions\":{\
          \"shape\":\"ResourceList\",\
          \"documentation\":\"<p>The actions to execute when this alarm transitions to the <code>ALARM</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN).</p> <p>Valid Values: arn:aws:automate:<i>region</i>:ec2:stop | arn:aws:automate:<i>region</i>:ec2:terminate | arn:aws:automate:<i>region</i>:ec2:recover | arn:aws:sns:<i>region</i>:<i>account-id</i>:<i>sns-topic-name</i> | arn:aws:autoscaling:<i>region</i>:<i>account-id</i>:scalingPolicy:<i>policy-id</i> autoScalingGroupName/<i>group-friendly-name</i>:policyName/<i>policy-friendly-name</i> </p> <p>Valid Values (for use with IAM roles): arn:aws:swf:<i>region</i>:{<i>account-id</i>}:action/actions/AWS_EC2.InstanceId.Stop/1.0 | arn:aws:swf:<i>region</i>:{<i>account-id</i>}:action/actions/AWS_EC2.InstanceId.Terminate/1.0 | arn:aws:swf:<i>region</i>:{<i>account-id</i>}:action/actions/AWS_EC2.InstanceId.Reboot/1.0</p>\"\
        },\
        \"InsufficientDataActions\":{\
          \"shape\":\"ResourceList\",\
          \"documentation\":\"<p>The actions to execute when this alarm transitions to the <code>INSUFFICIENT_DATA</code> state from any other state. Each action is specified as an Amazon Resource Name (ARN).</p> <p>Valid Values: arn:aws:automate:<i>region</i>:ec2:stop | arn:aws:automate:<i>region</i>:ec2:terminate | arn:aws:automate:<i>region</i>:ec2:recover | arn:aws:sns:<i>region</i>:<i>account-id</i>:<i>sns-topic-name</i> | arn:aws:autoscaling:<i>region</i>:<i>account-id</i>:scalingPolicy:<i>policy-id</i> autoScalingGroupName/<i>group-friendly-name</i>:policyName/<i>policy-friendly-name</i> </p> <p>Valid Values (for use with IAM roles): arn:aws:swf:<i>region</i>:{<i>account-id</i>}:action/actions/AWS_EC2.InstanceId.Stop/1.0 | arn:aws:swf:<i>region</i>:{<i>account-id</i>}:action/actions/AWS_EC2.InstanceId.Terminate/1.0 | arn:aws:swf:<i>region</i>:{<i>account-id</i>}:action/actions/AWS_EC2.InstanceId.Reboot/1.0</p>\"\
        },\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name for the metric associated with the alarm.</p>\"\
        },\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace for the metric associated with the alarm.</p>\"\
        },\
        \"Statistic\":{\
          \"shape\":\"Statistic\",\
          \"documentation\":\"<p>The statistic for the metric associated with the alarm, other than percentile. For percentile statistics, use <code>ExtendedStatistic</code>. When you call <code>PutMetricAlarm</code>, you must specify either <code>Statistic</code> or <code>ExtendedStatistic,</code> but not both.</p>\"\
        },\
        \"ExtendedStatistic\":{\
          \"shape\":\"ExtendedStatistic\",\
          \"documentation\":\"<p>The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100. When you call <code>PutMetricAlarm</code>, you must specify either <code>Statistic</code> or <code>ExtendedStatistic,</code> but not both.</p>\"\
        },\
        \"Dimensions\":{\
          \"shape\":\"Dimensions\",\
          \"documentation\":\"<p>The dimensions for the metric associated with the alarm.</p>\"\
        },\
        \"Period\":{\
          \"shape\":\"Period\",\
          \"documentation\":\"<p>The period, in seconds, over which the specified statistic is applied. Valid values are 10, 30, and any multiple of 60.</p> <p>Be sure to specify 10 or 30 only for metrics that are stored by a <code>PutMetricData</code> call with a <code>StorageResolution</code> of 1. If you specify a period of 10 or 30 for a metric that does not have sub-minute resolution, the alarm still attempts to gather data at the period rate that you specify. In this case, it does not receive data for the attempts that do not correspond to a one-minute data resolution, and the alarm may often lapse into INSUFFICENT_DATA status. Specifying 10 or 30 also sets this alarm as a high-resolution alarm, which has a higher charge than other alarms. For more information about pricing, see <a href=\\\"https://aws.amazon.com/cloudwatch/pricing/\\\">Amazon CloudWatch Pricing</a>.</p> <p>An alarm's total current evaluation period can be no longer than one day, so <code>Period</code> multiplied by <code>EvaluationPeriods</code> cannot be more than 86,400 seconds.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"StandardUnit\",\
          \"documentation\":\"<p>The unit of measure for the statistic. For example, the units for the Amazon EC2 NetworkIn metric are Bytes because NetworkIn tracks the number of bytes that an instance receives on all network interfaces. You can also specify a unit when you create a custom metric. Units help provide conceptual meaning to your data. Metric data points that specify a unit of measure, such as Percent, are aggregated separately.</p> <p>If you specify a unit, you must use a unit that is appropriate for the metric. Otherwise, the CloudWatch alarm can get stuck in the <code>INSUFFICIENT DATA</code> state. </p>\"\
        },\
        \"EvaluationPeriods\":{\
          \"shape\":\"EvaluationPeriods\",\
          \"documentation\":\"<p>The number of periods over which data is compared to the specified threshold. If you are setting an alarm which requires that a number of consecutive data points be breaching to trigger the alarm, this value specifies that number. If you are setting an \\\"M out of N\\\" alarm, this value is the N.</p> <p>An alarm's total current evaluation period can be no longer than one day, so this number multiplied by <code>Period</code> cannot be more than 86,400 seconds.</p>\"\
        },\
        \"DatapointsToAlarm\":{\
          \"shape\":\"DatapointsToAlarm\",\
          \"documentation\":\"<p>The number of datapoints that must be breaching to trigger the alarm. This is used only if you are setting an \\\"M out of N\\\" alarm. In that case, this value is the M. For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarm-evaluation\\\">Evaluating an Alarm</a> in the <i>Amazon CloudWatch User Guide</i>.</p>\"\
        },\
        \"Threshold\":{\
          \"shape\":\"Threshold\",\
          \"documentation\":\"<p>The value against which the specified statistic is compared.</p>\"\
        },\
        \"ComparisonOperator\":{\
          \"shape\":\"ComparisonOperator\",\
          \"documentation\":\"<p> The arithmetic operation to use when comparing the specified statistic and threshold. The specified statistic value is used as the first operand.</p>\"\
        },\
        \"TreatMissingData\":{\
          \"shape\":\"TreatMissingData\",\
          \"documentation\":\"<p> Sets how this alarm is to handle missing data points. If <code>TreatMissingData</code> is omitted, the default behavior of <code>missing</code> is used. For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarms-and-missing-data\\\">Configuring How CloudWatch Alarms Treats Missing Data</a>.</p> <p>Valid Values: <code>breaching | notBreaching | ignore | missing</code> </p>\"\
        },\
        \"EvaluateLowSampleCountPercentile\":{\
          \"shape\":\"EvaluateLowSampleCountPercentile\",\
          \"documentation\":\"<p> Used only for alarms based on percentiles. If you specify <code>ignore</code>, the alarm state does not change during periods with too few data points to be statistically significant. If you specify <code>evaluate</code> or omit this parameter, the alarm is always evaluated and possibly changes state no matter how many data points are available. For more information, see <a href=\\\"http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#percentiles-with-low-samples\\\">Percentile-Based CloudWatch Alarms and Low Data Samples</a>.</p> <p>Valid Values: <code>evaluate | ignore</code> </p>\"\
        }\
      }\
    },\
    \"PutMetricDataInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Namespace\",\
        \"MetricData\"\
      ],\
      \"members\":{\
        \"Namespace\":{\
          \"shape\":\"Namespace\",\
          \"documentation\":\"<p>The namespace for the metric data.</p> <p>You cannot specify a namespace that begins with \\\"AWS/\\\". Namespaces that begin with \\\"AWS/\\\" are reserved for use by Amazon Web Services products.</p>\"\
        },\
        \"MetricData\":{\
          \"shape\":\"MetricData\",\
          \"documentation\":\"<p>The data for the metric.</p>\"\
        }\
      }\
    },\
    \"ResourceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceName\"},\
      \"max\":5\
    },\
    \"ResourceName\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"ResourceNotFound\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ErrorMessage\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>The named resource does not exist.</p>\",\
      \"error\":{\
        \"code\":\"ResourceNotFound\",\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ReturnData\":{\"type\":\"boolean\"},\
    \"ScanBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TimestampDescending\",\
        \"TimestampAscending\"\
      ]\
    },\
    \"SetAlarmStateInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AlarmName\",\
        \"StateValue\",\
        \"StateReason\"\
      ],\
      \"members\":{\
        \"AlarmName\":{\
          \"shape\":\"AlarmName\",\
          \"documentation\":\"<p>The name for the alarm. This name must be unique within the AWS account. The maximum length is 255 characters.</p>\"\
        },\
        \"StateValue\":{\
          \"shape\":\"StateValue\",\
          \"documentation\":\"<p>The value of the state.</p>\"\
        },\
        \"StateReason\":{\
          \"shape\":\"StateReason\",\
          \"documentation\":\"<p>The reason that this alarm is set to this specific state, in text format.</p>\"\
        },\
        \"StateReasonData\":{\
          \"shape\":\"StateReasonData\",\
          \"documentation\":\"<p>The reason that this alarm is set to this specific state, in JSON format.</p>\"\
        }\
      }\
    },\
    \"Size\":{\"type\":\"long\"},\
    \"StandardUnit\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Seconds\",\
        \"Microseconds\",\
        \"Milliseconds\",\
        \"Bytes\",\
        \"Kilobytes\",\
        \"Megabytes\",\
        \"Gigabytes\",\
        \"Terabytes\",\
        \"Bits\",\
        \"Kilobits\",\
        \"Megabits\",\
        \"Gigabits\",\
        \"Terabits\",\
        \"Percent\",\
        \"Count\",\
        \"Bytes/Second\",\
        \"Kilobytes/Second\",\
        \"Megabytes/Second\",\
        \"Gigabytes/Second\",\
        \"Terabytes/Second\",\
        \"Bits/Second\",\
        \"Kilobits/Second\",\
        \"Megabits/Second\",\
        \"Gigabits/Second\",\
        \"Terabits/Second\",\
        \"Count/Second\",\
        \"None\"\
      ]\
    },\
    \"Stat\":{\"type\":\"string\"},\
    \"StateReason\":{\
      \"type\":\"string\",\
      \"max\":1023,\
      \"min\":0\
    },\
    \"StateReasonData\":{\
      \"type\":\"string\",\
      \"max\":4000,\
      \"min\":0\
    },\
    \"StateValue\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"OK\",\
        \"ALARM\",\
        \"INSUFFICIENT_DATA\"\
      ]\
    },\
    \"Statistic\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SampleCount\",\
        \"Average\",\
        \"Sum\",\
        \"Minimum\",\
        \"Maximum\"\
      ]\
    },\
    \"StatisticSet\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SampleCount\",\
        \"Sum\",\
        \"Minimum\",\
        \"Maximum\"\
      ],\
      \"members\":{\
        \"SampleCount\":{\
          \"shape\":\"DatapointValue\",\
          \"documentation\":\"<p>The number of samples used for the statistic set.</p>\"\
        },\
        \"Sum\":{\
          \"shape\":\"DatapointValue\",\
          \"documentation\":\"<p>The sum of values for the sample set.</p>\"\
        },\
        \"Minimum\":{\
          \"shape\":\"DatapointValue\",\
          \"documentation\":\"<p>The minimum value of the sample set.</p>\"\
        },\
        \"Maximum\":{\
          \"shape\":\"DatapointValue\",\
          \"documentation\":\"<p>The maximum value of the sample set.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a set of statistics that describes a specific metric. </p>\"\
    },\
    \"Statistics\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Statistic\"},\
      \"max\":5,\
      \"min\":1\
    },\
    \"StatusCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Complete\",\
        \"InternalError\",\
        \"PartialData\"\
      ]\
    },\
    \"StorageResolution\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"Threshold\":{\"type\":\"double\"},\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"Timestamps\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Timestamp\"}\
    },\
    \"TreatMissingData\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    }\
  },\
  \"documentation\":\"<p>Amazon CloudWatch monitors your Amazon Web Services (AWS) resources and the applications you run on AWS in real time. You can use CloudWatch to collect and track metrics, which are the variables you want to measure for your resources and applications.</p> <p>CloudWatch alarms send notifications or automatically change the resources you are monitoring based on rules that you define. For example, you can monitor the CPU usage and disk reads and writes of your Amazon EC2 instances. Then, use this data to determine whether you should launch additional instances to handle increased load. You can also use this data to stop under-used instances to save money.</p> <p>In addition to monitoring the built-in metrics that come with AWS, you can monitor your own custom metrics. With CloudWatch, you gain system-wide visibility into resource utilization, application performance, and operational health.</p>\"\
}\
";
}

@end
