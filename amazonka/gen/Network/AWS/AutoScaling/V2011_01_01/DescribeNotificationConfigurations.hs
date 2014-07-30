{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.AutoScaling.V2011_01_01.DescribeNotificationConfigurations
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns a list of notification actions associated with Auto Scaling groups
-- for specified events.
module Network.AWS.AutoScaling.V2011_01_01.DescribeNotificationConfigurations where

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
import           Network.AWS.AutoScaling.V2011_01_01.Types
import           Network.HTTP.Client  (RequestBody, Response)
import           Prelude              hiding (head)

-- | Minimum specification for a 'DescribeNotificationConfigurations' request.
describeNotificationConfigurations :: DescribeNotificationConfigurations
describeNotificationConfigurations = DescribeNotificationConfigurations
    { _dncuAutoScalingGroupNames = mempty
    , _dncuMaxRecords = Nothing
    , _dncuNextToken = Nothing
    }

data DescribeNotificationConfigurations = DescribeNotificationConfigurations
    { _dncuAutoScalingGroupNames :: [Text]
      -- ^ The name of the Auto Scaling group.
    , _dncuMaxRecords :: Maybe Integer
      -- ^ Maximum number of records to be returned.
    , _dncuNextToken :: Maybe Text
      -- ^ A string that is used to mark the start of the next batch of
      -- returned results for pagination.
    } deriving (Generic)

instance ToQuery DescribeNotificationConfigurations where
    toQuery = genericToQuery def

instance AWSRequest DescribeNotificationConfigurations where
    type Sv DescribeNotificationConfigurations = AutoScaling
    type Rs DescribeNotificationConfigurations = DescribeNotificationConfigurationsResponse

    request = post "DescribeNotificationConfigurations"
    response _ = xmlResponse

instance AWSPager DescribeNotificationConfigurations where
    next rq rs = (\x -> rq { _dncuNextToken = Just x })
        <$> _dncaNextToken rs

data DescribeNotificationConfigurationsResponse = DescribeNotificationConfigurationsResponse
    { _dncaNotificationConfigurations :: [NotificationConfiguration]
      -- ^ The list of notification configurations.
    , _dncaNextToken :: Maybe Text
      -- ^ A string that is used to mark the start of the next batch of
      -- returned results for pagination.
    } deriving (Generic)

instance FromXML DescribeNotificationConfigurationsResponse where
    fromXMLOptions = xmlOptions
