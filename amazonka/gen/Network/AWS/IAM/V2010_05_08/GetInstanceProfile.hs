{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.IAM.V2010_05_08.GetInstanceProfile
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Retrieves information about the specified instance profile, including the
-- instance profile's path, GUID, ARN, and role. For more information about
-- instance profiles, go to About Instance Profiles. For more information
-- about ARNs, go to ARNs. https://iam.amazonaws.com/
-- ?Action=GetInstanceProfile &InstanceProfileName=Webserver
-- &Version=2010-05-08 &AUTHPARAMS AIPAD5ARO2C5EXAMPLE3G
-- /application_abc/component_xyz/
-- arn:aws:iam::123456789012:role/application_abc/component_xyz/S3Access
-- S3Access
-- {"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":["ec2.amazonaws.com"]},"Action":["sts:AssumeRole"]}]}
-- 2012-05-09T15:45:35Z AROACVYKSVTSZFEXAMPLE Webserver
-- /application_abc/component_xyz/
-- arn:aws:iam::123456789012:instance-profile/application_abc/component_xyz/Webserver
-- 2012-05-09T16:11:10Z 37289fda-99f2-11e1-a4c3-27EXAMPLE804.
module Network.AWS.IAM.V2010_05_08.GetInstanceProfile where

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
import           Network.AWS.IAM.V2010_05_08.Types
import           Network.HTTP.Client  (RequestBody, Response)
import           Prelude              hiding (head)

data GetInstanceProfile = GetInstanceProfile
    { _giprInstanceProfileName :: Text
      -- ^ Name of the instance profile to get information about.
    } deriving (Generic)

instance ToQuery GetInstanceProfile where
    toQuery = genericToQuery def

instance AWSRequest GetInstanceProfile where
    type Sv GetInstanceProfile = IAM
    type Rs GetInstanceProfile = GetInstanceProfileResponse

    request = post "GetInstanceProfile"
    response _ = xmlResponse

data GetInstanceProfileResponse = GetInstanceProfileResponse
    { _gipsInstanceProfile :: InstanceProfile
      -- ^ Information about the instance profile.
    } deriving (Generic)

instance FromXML GetInstanceProfileResponse where
    fromXMLOptions = xmlOptions
