{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.RDS.V2013_09_09.CreateOptionGroup
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Creates a new option group. You can create up to 20 option groups.
-- https://rds.amazonaws.com/ ?Action=CreateOptionGroup
-- &OptionGroupName=myoptiongroup &EngineName=oracle-se1
-- &MajorEngineVersion=11.2 &OptionGroupDescription=Test option group 11.2
-- myoptiongroup oracle-se1 Test option group
-- b2416a8a-84c9-11e1-a264-0b23c28bc344.
module Network.AWS.RDS.V2013_09_09.CreateOptionGroup where

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

-- | Minimum specification for a 'CreateOptionGroup' request.
createOptionGroup :: Text -- ^ '_cogmOptionGroupDescription'
                  -> Text -- ^ '_cogmEngineName'
                  -> Text -- ^ '_cogmMajorEngineVersion'
                  -> Text -- ^ '_cogmOptionGroupName'
                  -> CreateOptionGroup
createOptionGroup p1 p2 p3 p4 = CreateOptionGroup
    { _cogmOptionGroupDescription = p1
    , _cogmEngineName = p2
    , _cogmMajorEngineVersion = p3
    , _cogmOptionGroupName = p4
    , _cogmTags = mempty
    }

data CreateOptionGroup = CreateOptionGroup
    { _cogmOptionGroupDescription :: Text
      -- ^ The description of the option group.
    , _cogmEngineName :: Text
      -- ^ Specifies the name of the engine that this option group should be
      -- associated with.
    , _cogmMajorEngineVersion :: Text
      -- ^ Specifies the major version of the engine that this option group
      -- should be associated with.
    , _cogmOptionGroupName :: Text
      -- ^ Specifies the name of the option group to be created.
      -- Constraints: Must be 1 to 255 alphanumeric characters or hyphens
      -- First character must be a letter Cannot end with a hyphen or
      -- contain two consecutive hyphens Example: myoptiongroup.
    , _cogmTags :: [Tag]
      -- ^ A list of tags.
    } deriving (Generic)

instance ToQuery CreateOptionGroup where
    toQuery = genericToQuery def

instance AWSRequest CreateOptionGroup where
    type Sv CreateOptionGroup = RDS
    type Rs CreateOptionGroup = CreateOptionGroupResponse

    request = post "CreateOptionGroup"
    response _ = xmlResponse

data CreateOptionGroupResponse = CreateOptionGroupResponse
    { _ogxOptionGroup :: Maybe OptionGroup
      -- ^ 
    } deriving (Generic)

instance FromXML CreateOptionGroupResponse where
    fromXMLOptions = xmlOptions
