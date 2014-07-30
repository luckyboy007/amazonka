{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.IAM.V2010_05_08.GetUserPolicy
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Retrieves the specified policy document for the specified user. The
-- returned policy is URL-encoded according to RFC 3986. For more information
-- about RFC 3986, go to http://www.faqs.org/rfcs/rfc3986.html.
-- https://iam.amazonaws.com/ ?Action=GetUserPolicy &UserName=Bob
-- &PolicyName=AllAccessPolicy &AUTHPARAMS Bob AllAccessPolicy
-- {"Version":"2012-10-17","Statement":[{"Effect":"Allow","Action":"*","Resource":"*"}]}
-- 7a62c49f-347e-4fc4-9331-6e8eEXAMPLE.
module Network.AWS.IAM.V2010_05_08.GetUserPolicy where

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

data GetUserPolicy = GetUserPolicy
    { _guprUserName :: Text
      -- ^ Name of the user who the policy is associated with.
    , _guprPolicyName :: Text
      -- ^ Name of the policy document to get.
    } deriving (Generic)

instance ToQuery GetUserPolicy where
    toQuery = genericToQuery def

instance AWSRequest GetUserPolicy where
    type Sv GetUserPolicy = IAM
    type Rs GetUserPolicy = GetUserPolicyResponse

    request = post "GetUserPolicy"
    response _ = xmlResponse

data GetUserPolicyResponse = GetUserPolicyResponse
    { _gupsUserName :: Text
      -- ^ The user the policy is associated with.
    , _gupsPolicyDocument :: Text
      -- ^ The policy document.
    , _gupsPolicyName :: Text
      -- ^ The name of the policy.
    } deriving (Generic)

instance FromXML GetUserPolicyResponse where
    fromXMLOptions = xmlOptions
