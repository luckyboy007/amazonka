{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudWatch.V2010_08_01.PutMetricData
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Publishes metric data points to Amazon CloudWatch. Amazon Cloudwatch
-- associates the data points with the specified metric. If the specified
-- metric does not exist, Amazon CloudWatch creates the metric. If you create
-- a metric with the PutMetricData action, allow up to fifteen minutes for the
-- metric to appear in calls to the ListMetrics action. The size of a
-- PutMetricData request is limited to 8 KB for HTTP GET requests and 40 KB
-- for HTTP POST requests. Although the Value parameter accepts numbers of
-- type Double, Amazon CloudWatch truncates values with very large exponents.
-- Values with base-10 exponents greater than 126 (1 x 10^126) are truncated.
-- Likewise, values with base-10 exponents less than -130 (1 x 10^-130) are
-- also truncated.
module Network.AWS.CloudWatch.V2010_08_01.PutMetricData where

import           Control.Applicative
import           Data.ByteString      (ByteString)
import           Data.Default
import           Data.HashMap.Strict  (HashMap)
import           Data.Monoid
import           Data.Text            (Text)
import qualified Data.Text            as Text
import           GHC.Generics
import           Network.AWS.Data
import           Network.AWS.Response
import           Network.AWS.Types    hiding (Error, Endpoint, Region)
import           Network.AWS.Request.Query
import           Network.AWS.CloudWatch.V2010_08_01.Types
import           Network.HTTP.Client  (RequestBody, Response)
import           Prelude              hiding (head)

data PutMetricData = PutMetricData
    { _pmdiMetricData :: [MetricDatum]
      -- ^ A list of data describing the metric.
    , _pmdiNamespace :: Text
      -- ^ The namespace for the metric data.
    } deriving (Generic)

instance ToQuery PutMetricData where
    toQuery = genericToQuery def

instance AWSRequest PutMetricData where
    type Sv PutMetricData = CloudWatch
    type Rs PutMetricData = PutMetricDataResponse

    request = post "PutMetricData"
    response _ _ = return (Right PutMetricDataResponse)

data PutMetricDataResponse = PutMetricDataResponse
    deriving (Eq, Show, Generic)
