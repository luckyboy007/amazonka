{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Redshift.V2012_12_01.DeleteClusterSecurityGroup
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes an Amazon Redshift security group. You cannot delete a security
-- group that is associated with any clusters. You cannot delete the default
-- security group. For information about managing security groups, go to
-- Amazon Redshift Cluster Security Groups in the Amazon Redshift Management
-- Guide. https://redshift.us-east-1.amazonaws.com/
-- ?Action=DeleteClusterSecurityGroup &ClusterSecurityGroupName=securitygroup1
-- &Version=2012-12-01 &x-amz-algorithm=AWS4-HMAC-SHA256
-- &x-amz-credential=AKIAIOSFODNN7EXAMPLE/20121208/us-east-1/redshift/aws4_request
-- &x-amz-date=20121208T015926Z
-- &x-amz-signedheaders=content-type;host;x-amz-date
-- e54e05dc-40da-11e2-955f-313c36e9e01d.
module Network.AWS.Redshift.V2012_12_01.DeleteClusterSecurityGroup where

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
import           Network.AWS.Redshift.V2012_12_01.Types
import           Network.HTTP.Client  (RequestBody, Response)
import           Prelude              hiding (head)

data DeleteClusterSecurityGroup = DeleteClusterSecurityGroup
    { _dcsgpClusterSecurityGroupName :: Text
      -- ^ The name of the cluster security group to be deleted.
    } deriving (Generic)

instance ToQuery DeleteClusterSecurityGroup where
    toQuery = genericToQuery def

instance AWSRequest DeleteClusterSecurityGroup where
    type Sv DeleteClusterSecurityGroup = Redshift
    type Rs DeleteClusterSecurityGroup = DeleteClusterSecurityGroupResponse

    request = post "DeleteClusterSecurityGroup"
    response _ _ = return (Right DeleteClusterSecurityGroupResponse)

data DeleteClusterSecurityGroupResponse = DeleteClusterSecurityGroupResponse
    deriving (Eq, Show, Generic)
