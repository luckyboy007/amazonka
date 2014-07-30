{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.IAM.V2010_05_08.UpdateLoginProfile
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Changes the password for the specified user. https://iam.amazonaws.com/
-- ?Action=UpdateLoginProfile &UserName=Bob &Password=NewPassword &AUTHPARAMS
-- 7a62c49f-347e-4fc4-9331-6e8eEXAMPLE.
module Network.AWS.IAM.V2010_05_08.UpdateLoginProfile where

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

-- | Minimum specification for a 'UpdateLoginProfile' request.
updateLoginProfile :: Text -- ^ '_ulprUserName'
                   -> UpdateLoginProfile
updateLoginProfile p1 = UpdateLoginProfile
    { _ulprUserName = p1
    , _ulprPasswordResetRequired = Nothing
    , _ulprPassword = Nothing
    }

data UpdateLoginProfile = UpdateLoginProfile
    { _ulprUserName :: Text
      -- ^ Name of the user whose password you want to update.
    , _ulprPasswordResetRequired :: Maybe Bool
      -- ^ Require the specified user to set a new password on next sign-in.
    , _ulprPassword :: Maybe Text
      -- ^ The new password for the specified user.
    } deriving (Generic)

instance ToQuery UpdateLoginProfile where
    toQuery = genericToQuery def

instance AWSRequest UpdateLoginProfile where
    type Sv UpdateLoginProfile = IAM
    type Rs UpdateLoginProfile = UpdateLoginProfileResponse

    request = post "UpdateLoginProfile"
    response _ _ = return (Right UpdateLoginProfileResponse)

data UpdateLoginProfileResponse = UpdateLoginProfileResponse
    deriving (Eq, Show, Generic)
