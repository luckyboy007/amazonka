{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.ELB.V2012_06_01.RegisterInstancesWithLoadBalancer
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Adds new instances to the load balancer. Once the instance is registered,
-- it starts receiving traffic and requests from the load balancer. Any
-- instance that is not in any of the Availability Zones registered for the
-- load balancer will be moved to the OutOfService state. It will move to the
-- InService state when the Availability Zone is added to the load balancer.
-- When an instance registered with a load balancer is stopped and then
-- restarted, the IP addresses associated with the instance changes. Elastic
-- Load Balancing cannot recognize the new IP address, which prevents it from
-- routing traffic to the instances. We recommend that you de-register your
-- Amazon EC2 instances from your load balancer after you stop your instance,
-- and then register the load balancer with your instance after you've
-- restarted. To de-register your instances from load balancer, use
-- DeregisterInstancesFromLoadBalancer action. For more information, see
-- De-register and Register Amazon EC2 Instances in the Elastic Load Balancing
-- Developer Guide. In order for this call to be successful, you must provide
-- the same account credentials as those that were used to create the load
-- balancer. Completion of this API does not guarantee that operation has
-- completed. Rather, it means that the request has been registered and the
-- changes will happen shortly. You can use DescribeLoadBalancers or
-- DescribeInstanceHealth action to check the state of the newly registered
-- instances.
-- https://elasticloadbalancing.amazonaws.com/?Instances.member.1.InstanceId=i-315b7e51
-- &LoadBalancerName=my-test-loadbalancer &Version=2012-06-01
-- &Action=RegisterInstancesWithLoadBalancer &AUTHPARAMS i-315b7e51
-- 83c88b9d-12b7-11e3-8b82-87b12EXAMPLE.
module Network.AWS.ELB.V2012_06_01.RegisterInstancesWithLoadBalancer where

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

data RegisterInstancesWithLoadBalancer = RegisterInstancesWithLoadBalancer
    { _repiLoadBalancerName :: Text
      -- ^ The name associated with the load balancer. The name must be
      -- unique within your set of load balancers.
    , _repiInstances :: [Instance]
      -- ^ A list of instance IDs that should be registered with the load
      -- balancer.
    } deriving (Generic)

instance ToQuery RegisterInstancesWithLoadBalancer where
    toQuery = genericToQuery def

instance AWSRequest RegisterInstancesWithLoadBalancer where
    type Sv RegisterInstancesWithLoadBalancer = ELB
    type Rs RegisterInstancesWithLoadBalancer = RegisterInstancesWithLoadBalancerResponse

    request = post "RegisterInstancesWithLoadBalancer"
    response _ = xmlResponse

data RegisterInstancesWithLoadBalancerResponse = RegisterInstancesWithLoadBalancerResponse
    { _repoInstances :: [Instance]
      -- ^ An updated list of instances for the load balancer.
    } deriving (Generic)

instance FromXML RegisterInstancesWithLoadBalancerResponse where
    fromXMLOptions = xmlOptions
