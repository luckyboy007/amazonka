{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Redshift.V2012_12_01.RevokeSnapshotAccess
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Removes the ability of the specified AWS customer account to restore the
-- specified snapshot. If the account is currently restoring the snapshot, the
-- restore will run to completion. For more information about working with
-- snapshots, go to Amazon Redshift Snapshots in the Amazon Redshift
-- Management Guide.
module Network.AWS.Redshift.V2012_12_01.RevokeSnapshotAccess where

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

-- | Minimum specification for a 'RevokeSnapshotAccess' request.
revokeSnapshotAccess :: Text -- ^ '_rsamSnapshotIdentifier'
                     -> Text -- ^ '_rsamAccountWithRestoreAccess'
                     -> RevokeSnapshotAccess
revokeSnapshotAccess p1 p2 = RevokeSnapshotAccess
    { _rsamSnapshotIdentifier = p1
    , _rsamAccountWithRestoreAccess = p2
    , _rsamSnapshotClusterIdentifier = Nothing
    }

data RevokeSnapshotAccess = RevokeSnapshotAccess
    { _rsamSnapshotIdentifier :: Text
      -- ^ The identifier of the snapshot that the account can no longer
      -- access.
    , _rsamAccountWithRestoreAccess :: Text
      -- ^ The identifier of the AWS customer account that can no longer
      -- restore the specified snapshot.
    , _rsamSnapshotClusterIdentifier :: Maybe Text
      -- ^ The identifier of the cluster the snapshot was created from. This
      -- parameter is required if your IAM user has a policy containing a
      -- snapshot resource element that specifies anything other than *
      -- for the cluster name.
    } deriving (Generic)

instance ToQuery RevokeSnapshotAccess where
    toQuery = genericToQuery def

instance AWSRequest RevokeSnapshotAccess where
    type Sv RevokeSnapshotAccess = Redshift
    type Rs RevokeSnapshotAccess = RevokeSnapshotAccessResponse

    request = post "RevokeSnapshotAccess"
    response _ = xmlResponse

data RevokeSnapshotAccessResponse = RevokeSnapshotAccessResponse
    { _sssssssssssssssssssssssssssssssssssrSnapshot :: Maybe Snapshot
      -- ^ Describes a snapshot.
    } deriving (Generic)

instance FromXML RevokeSnapshotAccessResponse where
    fromXMLOptions = xmlOptions
