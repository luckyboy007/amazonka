{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.ElastiCache.V2014_03_24.ResetCacheParameterGroup
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | The ResetCacheParameterGroup operation modifies the parameters of a cache
-- parameter group to the engine or system default value. You can reset
-- specific parameters by submitting a list of parameter names. To reset the
-- entire cache parameter group, specify the ResetAllParameters and
-- CacheParameterGroupName parameters.
module Network.AWS.ElastiCache.V2014_03_24.ResetCacheParameterGroup where

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
import           Network.AWS.ElastiCache.V2014_03_24.Types
import           Network.HTTP.Client  (RequestBody, Response)
import           Prelude              hiding (head)

-- | Minimum specification for a 'ResetCacheParameterGroup' request.
resetCacheParameterGroup :: [ParameterNameValue] -- ^ '_rcpgmParameterNameValues'
                         -> Text -- ^ '_rcpgmCacheParameterGroupName'
                         -> ResetCacheParameterGroup
resetCacheParameterGroup p1 p2 = ResetCacheParameterGroup
    { _rcpgmParameterNameValues = p1
    , _rcpgmCacheParameterGroupName = p2
    , _rcpgmResetAllParameters = Nothing
    }

data ResetCacheParameterGroup = ResetCacheParameterGroup
    { _rcpgmParameterNameValues :: [ParameterNameValue]
      -- ^ An array of parameter names to be reset. If you are not resetting
      -- the entire cache parameter group, you must specify at least one
      -- parameter name.
    , _rcpgmCacheParameterGroupName :: Text
      -- ^ The name of the cache parameter group to reset.
    , _rcpgmResetAllParameters :: Maybe Bool
      -- ^ If true, all parameters in the cache parameter group will be
      -- reset to default values. If false, no such action occurs. Valid
      -- values: true | false.
    } deriving (Generic)

instance ToQuery ResetCacheParameterGroup where
    toQuery = genericToQuery def

instance AWSRequest ResetCacheParameterGroup where
    type Sv ResetCacheParameterGroup = ElastiCache
    type Rs ResetCacheParameterGroup = ResetCacheParameterGroupResponse

    request = post "ResetCacheParameterGroup"
    response _ = xmlResponse

data ResetCacheParameterGroupResponse = ResetCacheParameterGroupResponse
    { _cpgnnCacheParameterGroupName :: Maybe Text
      -- ^ The name of the cache parameter group.
    } deriving (Generic)

instance FromXML ResetCacheParameterGroupResponse where
    fromXMLOptions = xmlOptions
