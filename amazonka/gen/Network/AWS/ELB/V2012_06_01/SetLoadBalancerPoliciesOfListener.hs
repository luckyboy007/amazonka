{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.ELB.V2012_06_01.SetLoadBalancerPoliciesOfListener
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Associates, updates, or disables a policy with a listener on the load
-- balancer. You can associate multiple policies with a listener. Associate
-- MySSLNegotiationPolicy with the load balancer port 443 on the
-- MyInternalLoadbalancer load balancer.
-- https://elasticloadbalancing.amazonaws.com/?PolicyNames.member.1=MySSLNegotiationPolicy
-- &LoadBalancerName=MyInternalLoadBalancer &LoadBalancerPort=443
-- &Version=2012-06-01 &Action=SetLoadBalancerPoliciesOfListener &AUTHPARAMS
-- azonaws.com/doc/2012-06-01/"> 07b1ecbc-1100-11e3-acaf-dd7edEXAMPLE.
module Network.AWS.ELB.V2012_06_01.SetLoadBalancerPoliciesOfListener where

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
import           Network.AWS.ELB.V2012_06_01.Types
import           Network.HTTP.Client  (RequestBody, Response)
import           Prelude              hiding (head)

data SetLoadBalancerPoliciesOfListener = SetLoadBalancerPoliciesOfListener
    { _slbpoliLoadBalancerName :: Text
      -- ^ The name of the load balancer.
    , _slbpoliLoadBalancerPort :: Integer
      -- ^ The external port of the load balancer to associate the policy.
    , _slbpoliPolicyNames :: [Text]
      -- ^ List of policies to be associated with the listener. If the list
      -- is empty, the current policy is removed from the listener.
    } deriving (Generic)

instance ToQuery SetLoadBalancerPoliciesOfListener where
    toQuery = genericToQuery def

instance AWSRequest SetLoadBalancerPoliciesOfListener where
    type Sv SetLoadBalancerPoliciesOfListener = ELB
    type Rs SetLoadBalancerPoliciesOfListener = SetLoadBalancerPoliciesOfListenerResponse

    request = post "SetLoadBalancerPoliciesOfListener"
    response _ _ = return (Right SetLoadBalancerPoliciesOfListenerResponse)

data SetLoadBalancerPoliciesOfListenerResponse = SetLoadBalancerPoliciesOfListenerResponse
    deriving (Eq, Show, Generic)
