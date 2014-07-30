{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.CloudSearch.V2013_01_01.DescribeAvailabilityOptions
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Gets the availability options configured for a domain. By default, shows
-- the configuration with any pending changes. Set the Deployed option to true
-- to show the active configuration and exclude pending changes. For more
-- information, see Configuring Availability Options in the Amazon CloudSearch
-- Developer Guide.
module Network.AWS.CloudSearch.V2013_01_01.DescribeAvailabilityOptions where

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
import           Network.AWS.CloudSearch.V2013_01_01.Types
import           Network.HTTP.Client  (RequestBody, Response)
import           Prelude              hiding (head)

-- | Minimum specification for a 'DescribeAvailabilityOptions' request.
describeAvailabilityOptions :: Text -- ^ '_daorDomainName'
                            -> DescribeAvailabilityOptions
describeAvailabilityOptions p1 = DescribeAvailabilityOptions
    { _daorDomainName = p1
    , _daorDeployed = Nothing
    }

data DescribeAvailabilityOptions = DescribeAvailabilityOptions
    { _daorDomainName :: Text
      -- ^ The name of the domain you want to describe.
    , _daorDeployed :: Maybe Bool
      -- ^ Whether to display the deployed configuration (true) or include
      -- any pending changes (false). Defaults to false.
    } deriving (Generic)

instance ToQuery DescribeAvailabilityOptions where
    toQuery = genericToQuery def

instance AWSRequest DescribeAvailabilityOptions where
    type Sv DescribeAvailabilityOptions = CloudSearch
    type Rs DescribeAvailabilityOptions = DescribeAvailabilityOptionsResponse

    request = post "DescribeAvailabilityOptions"
    response _ = xmlResponse

data DescribeAvailabilityOptionsResponse = DescribeAvailabilityOptionsResponse
    { _daosAvailabilityOptions :: Maybe AvailabilityOptionsStatus
      -- ^ The availability options configured for the domain. Indicates
      -- whether Multi-AZ is enabled for the domain.
    } deriving (Generic)

instance FromXML DescribeAvailabilityOptionsResponse where
    fromXMLOptions = xmlOptions
