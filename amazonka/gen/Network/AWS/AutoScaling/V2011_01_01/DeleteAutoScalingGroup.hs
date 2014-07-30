{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.AutoScaling.V2011_01_01.DeleteAutoScalingGroup
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes the specified Auto Scaling group if the group has no instances and
-- no scaling activities in progress. To remove all instances before calling
-- DeleteAutoScalingGroup, you can call UpdateAutoScalingGroup to set the
-- minimum and maximum size of the AutoScalingGroup to zero.
-- https://autoscaling.amazonaws.com/?AutoScalingGroupName=my-test-asg
-- &ForceDelete=true &Version=2011-01-01 &Action=DeleteAutoScalingGroup
-- &AUTHPARAMS 70a76d42-9665-11e2-9fdf-211deEXAMPLE.
module Network.AWS.AutoScaling.V2011_01_01.DeleteAutoScalingGroup where

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

-- | Minimum specification for a 'DeleteAutoScalingGroup' request.
deleteAutoScalingGroup :: Text -- ^ '_dasgtAutoScalingGroupName'
                       -> DeleteAutoScalingGroup
deleteAutoScalingGroup p1 = DeleteAutoScalingGroup
    { _dasgtAutoScalingGroupName = p1
    , _dasgtForceDelete = Nothing
    }

data DeleteAutoScalingGroup = DeleteAutoScalingGroup
    { _dasgtAutoScalingGroupName :: Text
      -- ^ The name of the Auto Scaling group to delete.
    , _dasgtForceDelete :: Maybe Bool
      -- ^ Starting with API version 2011-01-01, specifies that the Auto
      -- Scaling group will be deleted along with all instances associated
      -- with the group, without waiting for all instances to be
      -- terminated.
    } deriving (Generic)

instance ToQuery DeleteAutoScalingGroup where
    toQuery = genericToQuery def

instance AWSRequest DeleteAutoScalingGroup where
    type Sv DeleteAutoScalingGroup = AutoScaling
    type Rs DeleteAutoScalingGroup = DeleteAutoScalingGroupResponse

    request = post "DeleteAutoScalingGroup"
    response _ _ = return (Right DeleteAutoScalingGroupResponse)

data DeleteAutoScalingGroupResponse = DeleteAutoScalingGroupResponse
    deriving (Eq, Show, Generic)
