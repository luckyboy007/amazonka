{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.V2014_06_15.ReplaceNetworkAclAssociation
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Changes which network ACL a subnet is associated with. By default when you
-- create a subnet, it's automatically associated with the default network
-- ACL. For more information about network ACLs, see Network ACLs in the
-- Amazon Virtual Private Cloud User Guide. Example This example starts with a
-- network ACL associated with a subnet, and a corresponding association ID
-- aclassoc-e5b95c8c. You want to associate a different network ACL
-- (acl-5fb85d36) with the subnet. The result is a new association ID
-- representing the new association.
-- https://ec2.amazonaws.com/?Action=ReplaceNetworkAclAssociation
-- &amp;AssociationId=aclassoc-e5b95c8c &amp;NetworkAclId=acl-5fb85d36
-- &amp;AUTHPARAMS &lt;ReplaceNetworkAclAssociationResponse
-- xmlns="http://ec2.amazonaws.com/doc/2013-10-01/"&gt;
-- &lt;requestId&gt;59dbff89-35bd-4eac-99ed-be587EXAMPLE&lt;/requestId&gt;
-- &lt;newAssociationId&gt;aclassoc-17b85d7e&lt;/newAssociationId&gt;
-- &lt;/ReplaceNetworkAclAssociationResponse&gt;.
module Network.AWS.EC2.V2014_06_15.ReplaceNetworkAclAssociation where

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
import           Network.AWS.EC2.V2014_06_15.Types
import           Network.HTTP.Client  (RequestBody, Response)
import           Prelude              hiding (head)

-- | Minimum specification for a 'ReplaceNetworkAclAssociation' request.
replaceNetworkAclAssociation :: Text -- ^ '_rnaarAssociationId'
                             -> Text -- ^ '_rnaarNetworkAclId'
                             -> ReplaceNetworkAclAssociation
replaceNetworkAclAssociation p1 p2 = ReplaceNetworkAclAssociation
    { _rnaarAssociationId = p1
    , _rnaarNetworkAclId = p2
    , _rnaarDryRun = Nothing
    }

data ReplaceNetworkAclAssociation = ReplaceNetworkAclAssociation
    { _rnaarAssociationId :: Text
      -- ^ The ID of the current association between the original network
      -- ACL and the subnet.
    , _rnaarNetworkAclId :: Text
      -- ^ The ID of the new ACL to associate with the subnet.
    , _rnaarDryRun :: Maybe Bool
      -- ^ 
    } deriving (Generic)

instance ToQuery ReplaceNetworkAclAssociation where
    toQuery = genericToQuery def

instance AWSRequest ReplaceNetworkAclAssociation where
    type Sv ReplaceNetworkAclAssociation = EC2
    type Rs ReplaceNetworkAclAssociation = ReplaceNetworkAclAssociationResponse

    request = post "ReplaceNetworkAclAssociation"
    response _ = xmlResponse

data ReplaceNetworkAclAssociationResponse = ReplaceNetworkAclAssociationResponse
    { _rnaasNewAssociationId :: Maybe Text
      -- ^ The ID of the new association.
    } deriving (Generic)

instance FromXML ReplaceNetworkAclAssociationResponse where
    fromXMLOptions = xmlOptions
