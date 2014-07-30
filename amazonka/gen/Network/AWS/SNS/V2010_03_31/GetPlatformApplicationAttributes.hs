{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.SNS.V2010_03_31.GetPlatformApplicationAttributes
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Retrieves the attributes of the platform application object for the
-- supported push notification services, such as APNS and GCM. For more
-- information, see Using Amazon SNS Mobile Push Notifications. POST
-- http://sns.us-west-2.amazonaws.com/ HTTP/1.1 ...
-- PlatformApplicationArn=arn%3Aaws%3Asns%3Aus-west-2%3A123456789012%3Aapp%2FGCM%2Fgcmpushapp
-- &amp;Action=GetPlatformApplicationAttributes
-- &amp;SignatureMethod=HmacSHA256 &amp;AWSAccessKeyId=AKIAIOSFODNN7EXAMPLE
-- &amp;SignatureVersion=2 &amp;Version=2010-03-31
-- &amp;Signature=UGMaCq8CCJGSYXO9Ehr2VuHIBYSe6WbxkqgMKRslTK4%3D
-- &amp;Timestamp=2013-07-01T22%3A40%3A50.643Z HTTP/1.1 200 OK ...
-- &lt;GetPlatformApplicationAttributesResponse
-- xmlns="http://sns.amazonaws.com/doc/2010-03-31/"&gt;
-- &lt;GetPlatformApplicationAttributesResult&gt; &lt;Attributes&gt;
-- &lt;entry&gt; &lt;key&gt;AllowEndpointPolicies&lt;/key&gt;
-- &lt;value&gt;false&lt;/value&gt; &lt;/entry&gt; &lt;/Attributes&gt;
-- &lt;/GetPlatformApplicationAttributesResult&gt; &lt;ResponseMetadata&gt;
-- &lt;RequestId&gt;74848df2-87f6-55ed-890c-c7be80442462&lt;/RequestId&gt;
-- &lt;/ResponseMetadata&gt;
-- &lt;/GetPlatformApplicationAttributesResponse&gt;.
module Network.AWS.SNS.V2010_03_31.GetPlatformApplicationAttributes where

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
import           Network.AWS.SNS.V2010_03_31.Types
import           Network.HTTP.Client  (RequestBody, Response)
import           Prelude              hiding (head)

data GetPlatformApplicationAttributes = GetPlatformApplicationAttributes
    { _gpaaiPlatformApplicationArn :: Text
      -- ^ PlatformApplicationArn for GetPlatformApplicationAttributesInput.
    } deriving (Generic)

instance ToQuery GetPlatformApplicationAttributes where
    toQuery = genericToQuery def

instance AWSRequest GetPlatformApplicationAttributes where
    type Sv GetPlatformApplicationAttributes = SNS
    type Rs GetPlatformApplicationAttributes = GetPlatformApplicationAttributesResponse

    request = post "GetPlatformApplicationAttributes"
    response _ = xmlResponse

data GetPlatformApplicationAttributesResponse = GetPlatformApplicationAttributesResponse
    { _gpaarAttributes :: HashMap Text Text
      -- ^ Attributes include the following: EventEndpointCreated -- Topic
      -- ARN to which EndpointCreated event notifications should be sent.
      -- EventEndpointDeleted -- Topic ARN to which EndpointDeleted event
      -- notifications should be sent. EventEndpointUpdated -- Topic ARN
      -- to which EndpointUpdate event notifications should be sent.
      -- EventDeliveryFailure -- Topic ARN to which DeliveryFailure event
      -- notifications should be sent upon Direct Publish delivery failure
      -- (permanent) to one of the application's endpoints.
    } deriving (Generic)

instance FromXML GetPlatformApplicationAttributesResponse where
    fromXMLOptions = xmlOptions
