{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TemplateHaskell             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.DataPipeline.V2012_10_29.DescribePipelines
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Retrieve metadata about one or more pipelines. The information retrieved
-- includes the name of the pipeline, the pipeline identifier, its current
-- state, and the user account that owns the pipeline. Using account
-- credentials, you can retrieve metadata about pipelines that you or your IAM
-- users have created. If you are using an IAM user account, you can retrieve
-- metadata about only those pipelines you have read permission for. To
-- retrieve the full pipeline definition instead of metadata about the
-- pipeline, call the GetPipelineDefinition action. POST / HTTP/1.1
-- Content-Type: application/x-amz-json-1.1 X-Amz-Target:
-- DataPipeline.DescribePipelines Content-Length: 70 Host:
-- datapipeline.us-east-1.amazonaws.com X-Amz-Date: Mon, 12 Nov 2012 17:49:52
-- GMT Authorization: AuthParams {"pipelineIds": ["df-08785951KAKJEXAMPLE"] }
-- x-amzn-RequestId: 02870eb7-0736-11e2-af6f-6bc7a6be60d9 Content-Type:
-- application/x-amz-json-1.1 Content-Length: 767 Date: Mon, 12 Nov 2012
-- 17:50:53 GMT {"pipelineDescriptionList": [ {"description": "This is my
-- first pipeline", "fields": [ {"key": "@pipelineState", "stringValue":
-- "SCHEDULED"}, {"key": "description", "stringValue": "This is my first
-- pipeline"}, {"key": "name", "stringValue": "myPipeline"}, {"key":
-- "@creationTime", "stringValue": "2012-12-13T01:24:06"}, {"key": "@id",
-- "stringValue": "df-0937003356ZJEXAMPLE"}, {"key": "@sphere", "stringValue":
-- "PIPELINE"}, {"key": "@version", "stringValue": "1"}, {"key": "@userId",
-- "stringValue": "924374875933"}, {"key": "@accountId", "stringValue":
-- "924374875933"}, {"key": "uniqueId", "stringValue": "1234567890"} ],
-- "name": "myPipeline", "pipelineId": "df-0937003356ZJEXAMPLE"} ] }.
module Network.AWS.DataPipeline.V2012_10_29.DescribePipelines where

import Control.Lens.TH (makeLenses)
import Network.AWS.Request.JSON
import Network.AWS.DataPipeline.V2012_10_29.Types
import Network.AWS.Prelude
import qualified Network.AWS.Types.Map as Map

data DescribePipelines = DescribePipelines
    { _dpiPipelineIds :: [Text]
      -- ^ Identifiers of the pipelines to describe. You can pass as many as
      -- 25 identifiers in a single call to DescribePipelines. You can
      -- obtain pipeline identifiers by calling ListPipelines.
    } deriving (Show, Generic)

makeLenses ''DescribePipelines

instance ToPath DescribePipelines

instance ToQuery DescribePipelines

instance ToHeaders DescribePipelines

instance ToJSON DescribePipelines

data DescribePipelinesResponse = DescribePipelinesResponse
    { _dpoPipelineDescriptionList :: [PipelineDescription]
      -- ^ An array of descriptions returned for the specified pipelines.
    } deriving (Show, Generic)

makeLenses ''DescribePipelinesResponse

instance FromJSON DescribePipelinesResponse

instance AWSRequest DescribePipelines where
    type Sv DescribePipelines = DataPipeline
    type Rs DescribePipelines = DescribePipelinesResponse

    request = get
    response _ = jsonResponse
