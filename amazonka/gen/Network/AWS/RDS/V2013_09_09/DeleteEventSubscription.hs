{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.RDS.V2013_09_09.DeleteEventSubscription
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes an RDS event notification subscription.
-- https://rds.us-east-1.amazonaws.com/ ?Action=DeleteEventSubscription
-- &SubscriptionName=EventSubscription01 &Version=2013-01-10
-- &SignatureVersion=4 &SignatureMethod=HmacSHA256 &Timestamp=20130128T012739Z
-- &AWSAccessKeyId= &Signature= true 012345678901 db-instance deleting
-- 2013-01-28 00:29:23.736 creation deletion EventSubscription01
-- arn:aws:sns:us-east-1:012345678901:EventSubscription01
-- e7cf30ac-68e9-11e2-bd13-a92da73b3119.
module Network.AWS.RDS.V2013_09_09.DeleteEventSubscription where

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
import           Network.AWS.RDS.V2013_09_09.Types
import           Network.HTTP.Client  (RequestBody, Response)
import           Prelude              hiding (head)

data DeleteEventSubscription = DeleteEventSubscription
    { _desmSubscriptionName :: Text
      -- ^ The name of the RDS event notification subscription you want to
      -- delete.
    } deriving (Generic)

instance ToQuery DeleteEventSubscription where
    toQuery = genericToQuery def

instance AWSRequest DeleteEventSubscription where
    type Sv DeleteEventSubscription = RDS
    type Rs DeleteEventSubscription = DeleteEventSubscriptionResponse

    request = post "DeleteEventSubscription"
    response _ = xmlResponse

data DeleteEventSubscriptionResponse = DeleteEventSubscriptionResponse
    { _eserEventSubscription :: Maybe EventSubscription
      -- ^ Contains the results of a successful invocation of the
      -- DescribeEventSubscriptions action.
    } deriving (Generic)

instance FromXML DeleteEventSubscriptionResponse where
    fromXMLOptions = xmlOptions
