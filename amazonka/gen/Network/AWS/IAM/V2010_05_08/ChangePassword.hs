{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.IAM.V2010_05_08.ChangePassword
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Changes the password of the IAM user calling ChangePassword. The root
-- account password is not affected by this action. For information about
-- modifying passwords, see Managing Passwords in the Using IAM guide.
-- https://iam.amazonaws.com/ ?Action=ChangePassword &OldPassword=U79}kgds4?
-- &NewPassword=Lb0*1(9xpN &Version=2010-05-08 &AUTHPARAMS
-- 7a62c49f-347e-4fc4-9331-6e8eEXAMPLE.
module Network.AWS.IAM.V2010_05_08.ChangePassword where

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

data ChangePassword = ChangePassword
    { _cprNewPassword :: Text
      -- ^ The new password. The new password must conform to the AWS
      -- account's password policy, if one exists.
    , _cprOldPassword :: Text
      -- ^ The IAM users's current password.
    } deriving (Generic)

instance ToQuery ChangePassword where
    toQuery = genericToQuery def

instance AWSRequest ChangePassword where
    type Sv ChangePassword = IAM
    type Rs ChangePassword = ChangePasswordResponse

    request = post "ChangePassword"
    response _ _ = return (Right ChangePasswordResponse)

data ChangePasswordResponse = ChangePasswordResponse
    deriving (Eq, Show, Generic)
