{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IAM.CreateUser
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates a new IAM user for your AWS account.
--
-- For information about limitations on the number of IAM users you can create, see <http://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html Limitations on IAM Entities> in the /IAM User Guide/.
module Network.AWS.IAM.CreateUser
    (
    -- * Creating a Request
      createUser
    , CreateUser
    -- * Request Lenses
    , cuPath
    , cuUserName

    -- * Destructuring the Response
    , createUserResponse
    , CreateUserResponse
    -- * Response Lenses
    , cursUser
    , cursResponseStatus
    ) where

import           Network.AWS.IAM.Types
import           Network.AWS.IAM.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'createUser' smart constructor.
data CreateUser = CreateUser'
    { _cuPath     :: !(Maybe Text)
    , _cuUserName :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CreateUser' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cuPath'
--
-- * 'cuUserName'
createUser
    :: Text -- ^ 'cuUserName'
    -> CreateUser
createUser pUserName_ =
    CreateUser'
    { _cuPath = Nothing
    , _cuUserName = pUserName_
    }

-- | The path for the user name. For more information about paths, see <http://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html IAM Identifiers> in the /IAM User Guide/.
--
-- This parameter is optional. If it is not included, it defaults to a slash (\/).
--
-- The <http://wikipedia.org/wiki/regex regex pattern> for this parameter is a string of characters consisting of either a forward slash (\/) by itself or a string that must begin and end with forward slashes, containing any ASCII character from the ! (\\u0021) thru the DEL character (\\u007F), including most punctuation characters, digits, and upper and lowercased letters.
cuPath :: Lens' CreateUser (Maybe Text)
cuPath = lens _cuPath (\ s a -> s{_cuPath = a});

-- | The name of the user to create.
--
-- The <http://wikipedia.org/wiki/regex regex pattern> for this parameter is a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.\'-. User names are not distinguished by case. For example, you cannot create users named both \"TESTUSER\" and \"testuser\".
cuUserName :: Lens' CreateUser Text
cuUserName = lens _cuUserName (\ s a -> s{_cuUserName = a});

instance AWSRequest CreateUser where
        type Rs CreateUser = CreateUserResponse
        request = postQuery iam
        response
          = receiveXMLWrapper "CreateUserResult"
              (\ s h x ->
                 CreateUserResponse' <$>
                   (x .@? "User") <*> (pure (fromEnum s)))

instance Hashable CreateUser

instance NFData CreateUser

instance ToHeaders CreateUser where
        toHeaders = const mempty

instance ToPath CreateUser where
        toPath = const "/"

instance ToQuery CreateUser where
        toQuery CreateUser'{..}
          = mconcat
              ["Action" =: ("CreateUser" :: ByteString),
               "Version" =: ("2010-05-08" :: ByteString),
               "Path" =: _cuPath, "UserName" =: _cuUserName]

-- | Contains the response to a successful < CreateUser> request.
--
-- /See:/ 'createUserResponse' smart constructor.
data CreateUserResponse = CreateUserResponse'
    { _cursUser           :: !(Maybe User)
    , _cursResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CreateUserResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cursUser'
--
-- * 'cursResponseStatus'
createUserResponse
    :: Int -- ^ 'cursResponseStatus'
    -> CreateUserResponse
createUserResponse pResponseStatus_ =
    CreateUserResponse'
    { _cursUser = Nothing
    , _cursResponseStatus = pResponseStatus_
    }

-- | A structure with details about the new IAM user.
cursUser :: Lens' CreateUserResponse (Maybe User)
cursUser = lens _cursUser (\ s a -> s{_cursUser = a});

-- | The response status code.
cursResponseStatus :: Lens' CreateUserResponse Int
cursResponseStatus = lens _cursResponseStatus (\ s a -> s{_cursResponseStatus = a});

instance NFData CreateUserResponse
