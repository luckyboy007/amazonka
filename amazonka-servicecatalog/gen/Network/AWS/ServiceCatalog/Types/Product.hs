{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.ServiceCatalog.Types.Product
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Network.AWS.ServiceCatalog.Types.Product where

import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.ServiceCatalog.Types.Sum

-- | An administrator-specified constraint to apply when provisioning a product.
--
-- /See:/ 'constraintSummary' smart constructor.
data ConstraintSummary = ConstraintSummary'
    { _csType        :: !(Maybe Text)
    , _csDescription :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ConstraintSummary' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'csType'
--
-- * 'csDescription'
constraintSummary
    :: ConstraintSummary
constraintSummary =
    ConstraintSummary'
    { _csType = Nothing
    , _csDescription = Nothing
    }

-- | The type of the constraint.
csType :: Lens' ConstraintSummary (Maybe Text)
csType = lens _csType (\ s a -> s{_csType = a});

-- | The text description of the constraint.
csDescription :: Lens' ConstraintSummary (Maybe Text)
csDescription = lens _csDescription (\ s a -> s{_csDescription = a});

instance FromJSON ConstraintSummary where
        parseJSON
          = withObject "ConstraintSummary"
              (\ x ->
                 ConstraintSummary' <$>
                   (x .:? "Type") <*> (x .:? "Description"))

instance Hashable ConstraintSummary

instance NFData ConstraintSummary

-- | Summary information about a path for a user to have access to a specified product.
--
-- /See:/ 'launchPathSummary' smart constructor.
data LaunchPathSummary = LaunchPathSummary'
    { _lpsConstraintSummaries :: !(Maybe [ConstraintSummary])
    , _lpsName                :: !(Maybe Text)
    , _lpsId                  :: !(Maybe Text)
    , _lpsTags                :: !(Maybe [Tag])
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'LaunchPathSummary' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lpsConstraintSummaries'
--
-- * 'lpsName'
--
-- * 'lpsId'
--
-- * 'lpsTags'
launchPathSummary
    :: LaunchPathSummary
launchPathSummary =
    LaunchPathSummary'
    { _lpsConstraintSummaries = Nothing
    , _lpsName = Nothing
    , _lpsId = Nothing
    , _lpsTags = Nothing
    }

-- | List of constraints on the portfolio-product relationship.
lpsConstraintSummaries :: Lens' LaunchPathSummary [ConstraintSummary]
lpsConstraintSummaries = lens _lpsConstraintSummaries (\ s a -> s{_lpsConstraintSummaries = a}) . _Default . _Coerce;

-- | Corresponds to the name of the portfolio to which the user was assigned.
lpsName :: Lens' LaunchPathSummary (Maybe Text)
lpsName = lens _lpsName (\ s a -> s{_lpsName = a});

-- | The unique identifier of the product path.
lpsId :: Lens' LaunchPathSummary (Maybe Text)
lpsId = lens _lpsId (\ s a -> s{_lpsId = a});

-- | List of tags used by this launch path.
lpsTags :: Lens' LaunchPathSummary [Tag]
lpsTags = lens _lpsTags (\ s a -> s{_lpsTags = a}) . _Default . _Coerce;

instance FromJSON LaunchPathSummary where
        parseJSON
          = withObject "LaunchPathSummary"
              (\ x ->
                 LaunchPathSummary' <$>
                   (x .:? "ConstraintSummaries" .!= mempty) <*>
                     (x .:? "Name")
                     <*> (x .:? "Id")
                     <*> (x .:? "Tags" .!= mempty))

instance Hashable LaunchPathSummary

instance NFData LaunchPathSummary

-- | The search filter to limit results when listing request history records.
--
-- /See:/ 'listRecordHistorySearchFilter' smart constructor.
data ListRecordHistorySearchFilter = ListRecordHistorySearchFilter'
    { _lrhsfValue :: !(Maybe Text)
    , _lrhsfKey   :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ListRecordHistorySearchFilter' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lrhsfValue'
--
-- * 'lrhsfKey'
listRecordHistorySearchFilter
    :: ListRecordHistorySearchFilter
listRecordHistorySearchFilter =
    ListRecordHistorySearchFilter'
    { _lrhsfValue = Nothing
    , _lrhsfKey = Nothing
    }

-- | The filter value for 'Key'.
lrhsfValue :: Lens' ListRecordHistorySearchFilter (Maybe Text)
lrhsfValue = lens _lrhsfValue (\ s a -> s{_lrhsfValue = a});

-- | The filter key.
lrhsfKey :: Lens' ListRecordHistorySearchFilter (Maybe Text)
lrhsfKey = lens _lrhsfKey (\ s a -> s{_lrhsfKey = a});

instance Hashable ListRecordHistorySearchFilter

instance NFData ListRecordHistorySearchFilter

instance ToJSON ListRecordHistorySearchFilter where
        toJSON ListRecordHistorySearchFilter'{..}
          = object
              (catMaybes
                 [("Value" .=) <$> _lrhsfValue,
                  ("Key" .=) <$> _lrhsfKey])

-- | The constraints that the administrator has put on the parameter.
--
-- /See:/ 'parameterConstraints' smart constructor.
newtype ParameterConstraints = ParameterConstraints'
    { _pcAllowedValues :: Maybe [Text]
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ParameterConstraints' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'pcAllowedValues'
parameterConstraints
    :: ParameterConstraints
parameterConstraints =
    ParameterConstraints'
    { _pcAllowedValues = Nothing
    }

-- | The values that the administrator has allowed for the parameter.
pcAllowedValues :: Lens' ParameterConstraints [Text]
pcAllowedValues = lens _pcAllowedValues (\ s a -> s{_pcAllowedValues = a}) . _Default . _Coerce;

instance FromJSON ParameterConstraints where
        parseJSON
          = withObject "ParameterConstraints"
              (\ x ->
                 ParameterConstraints' <$>
                   (x .:? "AllowedValues" .!= mempty))

instance Hashable ParameterConstraints

instance NFData ParameterConstraints

-- | A single product view aggregation value\/count pair, containing metadata about each product to which the calling user has access.
--
-- /See:/ 'productViewAggregationValue' smart constructor.
data ProductViewAggregationValue = ProductViewAggregationValue'
    { _pvavValue            :: !(Maybe Text)
    , _pvavApproximateCount :: !(Maybe Int)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ProductViewAggregationValue' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'pvavValue'
--
-- * 'pvavApproximateCount'
productViewAggregationValue
    :: ProductViewAggregationValue
productViewAggregationValue =
    ProductViewAggregationValue'
    { _pvavValue = Nothing
    , _pvavApproximateCount = Nothing
    }

-- | The value of the product view aggregation.
pvavValue :: Lens' ProductViewAggregationValue (Maybe Text)
pvavValue = lens _pvavValue (\ s a -> s{_pvavValue = a});

-- | An approximate count of the products that match the value.
pvavApproximateCount :: Lens' ProductViewAggregationValue (Maybe Int)
pvavApproximateCount = lens _pvavApproximateCount (\ s a -> s{_pvavApproximateCount = a});

instance FromJSON ProductViewAggregationValue where
        parseJSON
          = withObject "ProductViewAggregationValue"
              (\ x ->
                 ProductViewAggregationValue' <$>
                   (x .:? "Value") <*> (x .:? "ApproximateCount"))

instance Hashable ProductViewAggregationValue

instance NFData ProductViewAggregationValue

-- | The summary metadata about the specified product.
--
-- /See:/ 'productViewSummary' smart constructor.
data ProductViewSummary = ProductViewSummary'
    { _pvsOwner              :: !(Maybe Text)
    , _pvsSupportURL         :: !(Maybe Text)
    , _pvsShortDescription   :: !(Maybe Text)
    , _pvsHasDefaultPath     :: !(Maybe Bool)
    , _pvsDistributor        :: !(Maybe Text)
    , _pvsName               :: !(Maybe Text)
    , _pvsId                 :: !(Maybe Text)
    , _pvsType               :: !(Maybe Text)
    , _pvsSupportEmail       :: !(Maybe Text)
    , _pvsProductId          :: !(Maybe Text)
    , _pvsSupportDescription :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ProductViewSummary' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'pvsOwner'
--
-- * 'pvsSupportURL'
--
-- * 'pvsShortDescription'
--
-- * 'pvsHasDefaultPath'
--
-- * 'pvsDistributor'
--
-- * 'pvsName'
--
-- * 'pvsId'
--
-- * 'pvsType'
--
-- * 'pvsSupportEmail'
--
-- * 'pvsProductId'
--
-- * 'pvsSupportDescription'
productViewSummary
    :: ProductViewSummary
productViewSummary =
    ProductViewSummary'
    { _pvsOwner = Nothing
    , _pvsSupportURL = Nothing
    , _pvsShortDescription = Nothing
    , _pvsHasDefaultPath = Nothing
    , _pvsDistributor = Nothing
    , _pvsName = Nothing
    , _pvsId = Nothing
    , _pvsType = Nothing
    , _pvsSupportEmail = Nothing
    , _pvsProductId = Nothing
    , _pvsSupportDescription = Nothing
    }

-- | The owner of the product. Contact the product administrator for the significance of this value.
pvsOwner :: Lens' ProductViewSummary (Maybe Text)
pvsOwner = lens _pvsOwner (\ s a -> s{_pvsOwner = a});

-- | The URL information to obtain support for this Product.
pvsSupportURL :: Lens' ProductViewSummary (Maybe Text)
pvsSupportURL = lens _pvsSupportURL (\ s a -> s{_pvsSupportURL = a});

-- | Short description of the product.
pvsShortDescription :: Lens' ProductViewSummary (Maybe Text)
pvsShortDescription = lens _pvsShortDescription (\ s a -> s{_pvsShortDescription = a});

-- | A value of 'false' indicates that the product does not have a default path, while a value of 'true' indicates that it does. If it\'s false, call < ListLaunchPaths> to disambiguate between paths. If true, < ListLaunchPaths> is not required, and the output of the < ProductViewSummary> operation can be used directly with < DescribeProvisioningParameters>.
pvsHasDefaultPath :: Lens' ProductViewSummary (Maybe Bool)
pvsHasDefaultPath = lens _pvsHasDefaultPath (\ s a -> s{_pvsHasDefaultPath = a});

-- | The distributor of the product. Contact the product administrator for the significance of this value.
pvsDistributor :: Lens' ProductViewSummary (Maybe Text)
pvsDistributor = lens _pvsDistributor (\ s a -> s{_pvsDistributor = a});

-- | The name of the product.
pvsName :: Lens' ProductViewSummary (Maybe Text)
pvsName = lens _pvsName (\ s a -> s{_pvsName = a});

-- | The product view identifier.
pvsId :: Lens' ProductViewSummary (Maybe Text)
pvsId = lens _pvsId (\ s a -> s{_pvsId = a});

-- | The product type. Contact the product administrator for the significance of this value.
pvsType :: Lens' ProductViewSummary (Maybe Text)
pvsType = lens _pvsType (\ s a -> s{_pvsType = a});

-- | The email contact information to obtain support for this Product.
pvsSupportEmail :: Lens' ProductViewSummary (Maybe Text)
pvsSupportEmail = lens _pvsSupportEmail (\ s a -> s{_pvsSupportEmail = a});

-- | The product identifier.
pvsProductId :: Lens' ProductViewSummary (Maybe Text)
pvsProductId = lens _pvsProductId (\ s a -> s{_pvsProductId = a});

-- | The description of the support for this Product.
pvsSupportDescription :: Lens' ProductViewSummary (Maybe Text)
pvsSupportDescription = lens _pvsSupportDescription (\ s a -> s{_pvsSupportDescription = a});

instance FromJSON ProductViewSummary where
        parseJSON
          = withObject "ProductViewSummary"
              (\ x ->
                 ProductViewSummary' <$>
                   (x .:? "Owner") <*> (x .:? "SupportUrl") <*>
                     (x .:? "ShortDescription")
                     <*> (x .:? "HasDefaultPath")
                     <*> (x .:? "Distributor")
                     <*> (x .:? "Name")
                     <*> (x .:? "Id")
                     <*> (x .:? "Type")
                     <*> (x .:? "SupportEmail")
                     <*> (x .:? "ProductId")
                     <*> (x .:? "SupportDescription"))

instance Hashable ProductViewSummary

instance NFData ProductViewSummary

-- | Detailed information about a ProvisionedProduct object.
--
-- /See:/ 'provisionedProductDetail' smart constructor.
data ProvisionedProductDetail = ProvisionedProductDetail'
    { _ppdIdempotencyToken :: !(Maybe Text)
    , _ppdStatus           :: !(Maybe RecordStatus)
    , _ppdARN              :: !(Maybe Text)
    , _ppdCreatedTime      :: !(Maybe POSIX)
    , _ppdStatusMessage    :: !(Maybe Text)
    , _ppdName             :: !(Maybe Text)
    , _ppdLastRecordId     :: !(Maybe Text)
    , _ppdId               :: !(Maybe Text)
    , _ppdType             :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ProvisionedProductDetail' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ppdIdempotencyToken'
--
-- * 'ppdStatus'
--
-- * 'ppdARN'
--
-- * 'ppdCreatedTime'
--
-- * 'ppdStatusMessage'
--
-- * 'ppdName'
--
-- * 'ppdLastRecordId'
--
-- * 'ppdId'
--
-- * 'ppdType'
provisionedProductDetail
    :: ProvisionedProductDetail
provisionedProductDetail =
    ProvisionedProductDetail'
    { _ppdIdempotencyToken = Nothing
    , _ppdStatus = Nothing
    , _ppdARN = Nothing
    , _ppdCreatedTime = Nothing
    , _ppdStatusMessage = Nothing
    , _ppdName = Nothing
    , _ppdLastRecordId = Nothing
    , _ppdId = Nothing
    , _ppdType = Nothing
    }

-- | An idempotency token that uniquely identifies this ProvisionedProduct.
ppdIdempotencyToken :: Lens' ProvisionedProductDetail (Maybe Text)
ppdIdempotencyToken = lens _ppdIdempotencyToken (\ s a -> s{_ppdIdempotencyToken = a});

-- | The current status of the ProvisionedProduct.
ppdStatus :: Lens' ProvisionedProductDetail (Maybe RecordStatus)
ppdStatus = lens _ppdStatus (\ s a -> s{_ppdStatus = a});

-- | The ARN associated with the ProvisionedProduct object.
ppdARN :: Lens' ProvisionedProductDetail (Maybe Text)
ppdARN = lens _ppdARN (\ s a -> s{_ppdARN = a});

-- | The time the ProvisionedProduct was created.
ppdCreatedTime :: Lens' ProvisionedProductDetail (Maybe UTCTime)
ppdCreatedTime = lens _ppdCreatedTime (\ s a -> s{_ppdCreatedTime = a}) . mapping _Time;

-- | The current status message of the ProvisionedProduct.
ppdStatusMessage :: Lens' ProvisionedProductDetail (Maybe Text)
ppdStatusMessage = lens _ppdStatusMessage (\ s a -> s{_ppdStatusMessage = a});

-- | The user-friendly name of the ProvisionedProduct object.
ppdName :: Lens' ProvisionedProductDetail (Maybe Text)
ppdName = lens _ppdName (\ s a -> s{_ppdName = a});

-- | The record identifier of the last request performed on this ProvisionedProduct object.
ppdLastRecordId :: Lens' ProvisionedProductDetail (Maybe Text)
ppdLastRecordId = lens _ppdLastRecordId (\ s a -> s{_ppdLastRecordId = a});

-- | The identifier of the ProvisionedProduct object.
ppdId :: Lens' ProvisionedProductDetail (Maybe Text)
ppdId = lens _ppdId (\ s a -> s{_ppdId = a});

-- | The type of the ProvisionedProduct object.
ppdType :: Lens' ProvisionedProductDetail (Maybe Text)
ppdType = lens _ppdType (\ s a -> s{_ppdType = a});

instance FromJSON ProvisionedProductDetail where
        parseJSON
          = withObject "ProvisionedProductDetail"
              (\ x ->
                 ProvisionedProductDetail' <$>
                   (x .:? "IdempotencyToken") <*> (x .:? "Status") <*>
                     (x .:? "Arn")
                     <*> (x .:? "CreatedTime")
                     <*> (x .:? "StatusMessage")
                     <*> (x .:? "Name")
                     <*> (x .:? "LastRecordId")
                     <*> (x .:? "Id")
                     <*> (x .:? "Type"))

instance Hashable ProvisionedProductDetail

instance NFData ProvisionedProductDetail

-- | Contains information indicating the ways in which a product can be provisioned.
--
-- /See:/ 'provisioningArtifact' smart constructor.
data ProvisioningArtifact = ProvisioningArtifact'
    { _paCreatedTime :: !(Maybe POSIX)
    , _paName        :: !(Maybe Text)
    , _paId          :: !(Maybe Text)
    , _paDescription :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ProvisioningArtifact' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'paCreatedTime'
--
-- * 'paName'
--
-- * 'paId'
--
-- * 'paDescription'
provisioningArtifact
    :: ProvisioningArtifact
provisioningArtifact =
    ProvisioningArtifact'
    { _paCreatedTime = Nothing
    , _paName = Nothing
    , _paId = Nothing
    , _paDescription = Nothing
    }

-- | The time that the artifact was created by the Administrator.
paCreatedTime :: Lens' ProvisioningArtifact (Maybe UTCTime)
paCreatedTime = lens _paCreatedTime (\ s a -> s{_paCreatedTime = a}) . mapping _Time;

-- | The name of the artifact.
paName :: Lens' ProvisioningArtifact (Maybe Text)
paName = lens _paName (\ s a -> s{_paName = a});

-- | The identifier for the artifact.
paId :: Lens' ProvisioningArtifact (Maybe Text)
paId = lens _paId (\ s a -> s{_paId = a});

-- | The text description of the artifact.
paDescription :: Lens' ProvisioningArtifact (Maybe Text)
paDescription = lens _paDescription (\ s a -> s{_paDescription = a});

instance FromJSON ProvisioningArtifact where
        parseJSON
          = withObject "ProvisioningArtifact"
              (\ x ->
                 ProvisioningArtifact' <$>
                   (x .:? "CreatedTime") <*> (x .:? "Name") <*>
                     (x .:? "Id")
                     <*> (x .:? "Description"))

instance Hashable ProvisioningArtifact

instance NFData ProvisioningArtifact

-- | A parameter used to successfully provision the product. This value includes a list of allowable values and additional metadata.
--
-- /See:/ 'provisioningArtifactParameter' smart constructor.
data ProvisioningArtifactParameter = ProvisioningArtifactParameter'
    { _papIsNoEcho             :: !(Maybe Bool)
    , _papParameterKey         :: !(Maybe Text)
    , _papParameterType        :: !(Maybe Text)
    , _papParameterConstraints :: !(Maybe ParameterConstraints)
    , _papDefaultValue         :: !(Maybe Text)
    , _papDescription          :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ProvisioningArtifactParameter' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'papIsNoEcho'
--
-- * 'papParameterKey'
--
-- * 'papParameterType'
--
-- * 'papParameterConstraints'
--
-- * 'papDefaultValue'
--
-- * 'papDescription'
provisioningArtifactParameter
    :: ProvisioningArtifactParameter
provisioningArtifactParameter =
    ProvisioningArtifactParameter'
    { _papIsNoEcho = Nothing
    , _papParameterKey = Nothing
    , _papParameterType = Nothing
    , _papParameterConstraints = Nothing
    , _papDefaultValue = Nothing
    , _papDescription = Nothing
    }

-- | If this value is true, the value for this parameter is obfuscated from view when the parameter is retrieved. This parameter is used to hide sensitive information.
papIsNoEcho :: Lens' ProvisioningArtifactParameter (Maybe Bool)
papIsNoEcho = lens _papIsNoEcho (\ s a -> s{_papIsNoEcho = a});

-- | The parameter key.
papParameterKey :: Lens' ProvisioningArtifactParameter (Maybe Text)
papParameterKey = lens _papParameterKey (\ s a -> s{_papParameterKey = a});

-- | The parameter type.
papParameterType :: Lens' ProvisioningArtifactParameter (Maybe Text)
papParameterType = lens _papParameterType (\ s a -> s{_papParameterType = a});

-- | The list of constraints that the administrator has put on the parameter.
papParameterConstraints :: Lens' ProvisioningArtifactParameter (Maybe ParameterConstraints)
papParameterConstraints = lens _papParameterConstraints (\ s a -> s{_papParameterConstraints = a});

-- | The default value for this parameter.
papDefaultValue :: Lens' ProvisioningArtifactParameter (Maybe Text)
papDefaultValue = lens _papDefaultValue (\ s a -> s{_papDefaultValue = a});

-- | The text description of the parameter.
papDescription :: Lens' ProvisioningArtifactParameter (Maybe Text)
papDescription = lens _papDescription (\ s a -> s{_papDescription = a});

instance FromJSON ProvisioningArtifactParameter where
        parseJSON
          = withObject "ProvisioningArtifactParameter"
              (\ x ->
                 ProvisioningArtifactParameter' <$>
                   (x .:? "IsNoEcho") <*> (x .:? "ParameterKey") <*>
                     (x .:? "ParameterType")
                     <*> (x .:? "ParameterConstraints")
                     <*> (x .:? "DefaultValue")
                     <*> (x .:? "Description"))

instance Hashable ProvisioningArtifactParameter

instance NFData ProvisioningArtifactParameter

-- | The arameter key\/value pairs used to provision a product.
--
-- /See:/ 'provisioningParameter' smart constructor.
data ProvisioningParameter = ProvisioningParameter'
    { _ppValue :: !(Maybe Text)
    , _ppKey   :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ProvisioningParameter' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ppValue'
--
-- * 'ppKey'
provisioningParameter
    :: ProvisioningParameter
provisioningParameter =
    ProvisioningParameter'
    { _ppValue = Nothing
    , _ppKey = Nothing
    }

-- | The value to use for provisioning. Any constraints on this value can be found in 'ProvisioningArtifactParameter' for 'Key'.
ppValue :: Lens' ProvisioningParameter (Maybe Text)
ppValue = lens _ppValue (\ s a -> s{_ppValue = a});

-- | The 'ProvisioningArtifactParameter.ParameterKey' parameter from < DescribeProvisioningParameters>.
ppKey :: Lens' ProvisioningParameter (Maybe Text)
ppKey = lens _ppKey (\ s a -> s{_ppKey = a});

instance Hashable ProvisioningParameter

instance NFData ProvisioningParameter

instance ToJSON ProvisioningParameter where
        toJSON ProvisioningParameter'{..}
          = object
              (catMaybes
                 [("Value" .=) <$> _ppValue, ("Key" .=) <$> _ppKey])

-- | The full details of a specific ProvisionedProduct object.
--
-- /See:/ 'recordDetail' smart constructor.
data RecordDetail = RecordDetail'
    { _rdStatus                 :: !(Maybe RecordStatus)
    , _rdRecordTags             :: !(Maybe [RecordTag])
    , _rdProvisionedProductName :: !(Maybe Text)
    , _rdProvisioningArtifactId :: !(Maybe Text)
    , _rdCreatedTime            :: !(Maybe POSIX)
    , _rdRecordType             :: !(Maybe Text)
    , _rdRecordId               :: !(Maybe Text)
    , _rdProvisionedProductType :: !(Maybe Text)
    , _rdUpdatedTime            :: !(Maybe POSIX)
    , _rdPathId                 :: !(Maybe Text)
    , _rdProvisionedProductId   :: !(Maybe Text)
    , _rdRecordErrors           :: !(Maybe [RecordError])
    , _rdProductId              :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'RecordDetail' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rdStatus'
--
-- * 'rdRecordTags'
--
-- * 'rdProvisionedProductName'
--
-- * 'rdProvisioningArtifactId'
--
-- * 'rdCreatedTime'
--
-- * 'rdRecordType'
--
-- * 'rdRecordId'
--
-- * 'rdProvisionedProductType'
--
-- * 'rdUpdatedTime'
--
-- * 'rdPathId'
--
-- * 'rdProvisionedProductId'
--
-- * 'rdRecordErrors'
--
-- * 'rdProductId'
recordDetail
    :: RecordDetail
recordDetail =
    RecordDetail'
    { _rdStatus = Nothing
    , _rdRecordTags = Nothing
    , _rdProvisionedProductName = Nothing
    , _rdProvisioningArtifactId = Nothing
    , _rdCreatedTime = Nothing
    , _rdRecordType = Nothing
    , _rdRecordId = Nothing
    , _rdProvisionedProductType = Nothing
    , _rdUpdatedTime = Nothing
    , _rdPathId = Nothing
    , _rdProvisionedProductId = Nothing
    , _rdRecordErrors = Nothing
    , _rdProductId = Nothing
    }

-- | The status of the ProvisionedProduct object.
rdStatus :: Lens' RecordDetail (Maybe RecordStatus)
rdStatus = lens _rdStatus (\ s a -> s{_rdStatus = a});

-- | List of tags associated with this record.
rdRecordTags :: Lens' RecordDetail [RecordTag]
rdRecordTags = lens _rdRecordTags (\ s a -> s{_rdRecordTags = a}) . _Default . _Coerce;

-- | The user-friendly name of the ProvisionedProduct object.
rdProvisionedProductName :: Lens' RecordDetail (Maybe Text)
rdProvisionedProductName = lens _rdProvisionedProductName (\ s a -> s{_rdProvisionedProductName = a});

-- | The provisioning artifact identifier for this product.
rdProvisioningArtifactId :: Lens' RecordDetail (Maybe Text)
rdProvisioningArtifactId = lens _rdProvisioningArtifactId (\ s a -> s{_rdProvisioningArtifactId = a});

-- | The time when the record for the ProvisionedProduct object was created.
rdCreatedTime :: Lens' RecordDetail (Maybe UTCTime)
rdCreatedTime = lens _rdCreatedTime (\ s a -> s{_rdCreatedTime = a}) . mapping _Time;

-- | The record type for this record.
rdRecordType :: Lens' RecordDetail (Maybe Text)
rdRecordType = lens _rdRecordType (\ s a -> s{_rdRecordType = a});

-- | The identifier of the ProvisionedProduct object record.
rdRecordId :: Lens' RecordDetail (Maybe Text)
rdRecordId = lens _rdRecordId (\ s a -> s{_rdRecordId = a});

-- | The type of the ProvisionedProduct object.
rdProvisionedProductType :: Lens' RecordDetail (Maybe Text)
rdProvisionedProductType = lens _rdProvisionedProductType (\ s a -> s{_rdProvisionedProductType = a});

-- | The time when the record for the ProvisionedProduct object was last updated.
rdUpdatedTime :: Lens' RecordDetail (Maybe UTCTime)
rdUpdatedTime = lens _rdUpdatedTime (\ s a -> s{_rdUpdatedTime = a}) . mapping _Time;

-- | The identifier of the path for this product\'s provisioning.
rdPathId :: Lens' RecordDetail (Maybe Text)
rdPathId = lens _rdPathId (\ s a -> s{_rdPathId = a});

-- | The identifier of the ProvisionedProduct object.
rdProvisionedProductId :: Lens' RecordDetail (Maybe Text)
rdProvisionedProductId = lens _rdProvisionedProductId (\ s a -> s{_rdProvisionedProductId = a});

-- | A list of errors that occurred while processing the request.
rdRecordErrors :: Lens' RecordDetail [RecordError]
rdRecordErrors = lens _rdRecordErrors (\ s a -> s{_rdRecordErrors = a}) . _Default . _Coerce;

-- | The identifier of the product.
rdProductId :: Lens' RecordDetail (Maybe Text)
rdProductId = lens _rdProductId (\ s a -> s{_rdProductId = a});

instance FromJSON RecordDetail where
        parseJSON
          = withObject "RecordDetail"
              (\ x ->
                 RecordDetail' <$>
                   (x .:? "Status") <*> (x .:? "RecordTags" .!= mempty)
                     <*> (x .:? "ProvisionedProductName")
                     <*> (x .:? "ProvisioningArtifactId")
                     <*> (x .:? "CreatedTime")
                     <*> (x .:? "RecordType")
                     <*> (x .:? "RecordId")
                     <*> (x .:? "ProvisionedProductType")
                     <*> (x .:? "UpdatedTime")
                     <*> (x .:? "PathId")
                     <*> (x .:? "ProvisionedProductId")
                     <*> (x .:? "RecordErrors" .!= mempty)
                     <*> (x .:? "ProductId"))

instance Hashable RecordDetail

instance NFData RecordDetail

-- | The error code and description resulting from an operation.
--
-- /See:/ 'recordError' smart constructor.
data RecordError = RecordError'
    { _reCode        :: !(Maybe Text)
    , _reDescription :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'RecordError' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'reCode'
--
-- * 'reDescription'
recordError
    :: RecordError
recordError =
    RecordError'
    { _reCode = Nothing
    , _reDescription = Nothing
    }

-- | The numeric value of the error.
reCode :: Lens' RecordError (Maybe Text)
reCode = lens _reCode (\ s a -> s{_reCode = a});

-- | The text description of the error.
reDescription :: Lens' RecordError (Maybe Text)
reDescription = lens _reDescription (\ s a -> s{_reDescription = a});

instance FromJSON RecordError where
        parseJSON
          = withObject "RecordError"
              (\ x ->
                 RecordError' <$>
                   (x .:? "Code") <*> (x .:? "Description"))

instance Hashable RecordError

instance NFData RecordError

-- | An output for the specified Product object created as the result of a request. For example, a CloudFormation-backed product that creates an S3 bucket would have an output for the S3 bucket URL.
--
-- /See:/ 'recordOutput' smart constructor.
data RecordOutput = RecordOutput'
    { _roOutputValue :: !(Maybe Text)
    , _roOutputKey   :: !(Maybe Text)
    , _roDescription :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'RecordOutput' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'roOutputValue'
--
-- * 'roOutputKey'
--
-- * 'roDescription'
recordOutput
    :: RecordOutput
recordOutput =
    RecordOutput'
    { _roOutputValue = Nothing
    , _roOutputKey = Nothing
    , _roDescription = Nothing
    }

-- | The output value.
roOutputValue :: Lens' RecordOutput (Maybe Text)
roOutputValue = lens _roOutputValue (\ s a -> s{_roOutputValue = a});

-- | The output key.
roOutputKey :: Lens' RecordOutput (Maybe Text)
roOutputKey = lens _roOutputKey (\ s a -> s{_roOutputKey = a});

-- | The text description of the output.
roDescription :: Lens' RecordOutput (Maybe Text)
roDescription = lens _roDescription (\ s a -> s{_roDescription = a});

instance FromJSON RecordOutput where
        parseJSON
          = withObject "RecordOutput"
              (\ x ->
                 RecordOutput' <$>
                   (x .:? "OutputValue") <*> (x .:? "OutputKey") <*>
                     (x .:? "Description"))

instance Hashable RecordOutput

instance NFData RecordOutput

-- | A tag associated with the record, stored as a key-value pair.
--
-- /See:/ 'recordTag' smart constructor.
data RecordTag = RecordTag'
    { _rtValue :: !(Maybe Text)
    , _rtKey   :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'RecordTag' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rtValue'
--
-- * 'rtKey'
recordTag
    :: RecordTag
recordTag =
    RecordTag'
    { _rtValue = Nothing
    , _rtKey = Nothing
    }

-- | The value for this tag.
rtValue :: Lens' RecordTag (Maybe Text)
rtValue = lens _rtValue (\ s a -> s{_rtValue = a});

-- | The key for this tag.
rtKey :: Lens' RecordTag (Maybe Text)
rtKey = lens _rtKey (\ s a -> s{_rtKey = a});

instance FromJSON RecordTag where
        parseJSON
          = withObject "RecordTag"
              (\ x ->
                 RecordTag' <$> (x .:? "Value") <*> (x .:? "Key"))

instance Hashable RecordTag

instance NFData RecordTag

-- | Optional key\/value pairs to associate with this provisioning. These tags are propagated to the resources created in the provisioning.
--
-- /See:/ 'tag' smart constructor.
data Tag = Tag'
    { _tagValue :: !(Maybe Text)
    , _tagKey   :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'Tag' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'tagValue'
--
-- * 'tagKey'
tag
    :: Tag
tag =
    Tag'
    { _tagValue = Nothing
    , _tagKey = Nothing
    }

-- | The esired value for this key.
tagValue :: Lens' Tag (Maybe Text)
tagValue = lens _tagValue (\ s a -> s{_tagValue = a});

-- | The 'ProvisioningArtifactParameter.TagKey' parameter from < DescribeProvisioningParameters>.
tagKey :: Lens' Tag (Maybe Text)
tagKey = lens _tagKey (\ s a -> s{_tagKey = a});

instance FromJSON Tag where
        parseJSON
          = withObject "Tag"
              (\ x -> Tag' <$> (x .:? "Value") <*> (x .:? "Key"))

instance Hashable Tag

instance NFData Tag

instance ToJSON Tag where
        toJSON Tag'{..}
          = object
              (catMaybes
                 [("Value" .=) <$> _tagValue, ("Key" .=) <$> _tagKey])

-- | The parameter key\/value pair used to update a ProvisionedProduct object. If 'UsePreviousValue' is set to true, 'Value' is ignored and the value for 'Key' is kept as previously set (current value).
--
-- /See:/ 'updateProvisioningParameter' smart constructor.
data UpdateProvisioningParameter = UpdateProvisioningParameter'
    { _uppValue            :: !(Maybe Text)
    , _uppKey              :: !(Maybe Text)
    , _uppUsePreviousValue :: !(Maybe Bool)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'UpdateProvisioningParameter' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'uppValue'
--
-- * 'uppKey'
--
-- * 'uppUsePreviousValue'
updateProvisioningParameter
    :: UpdateProvisioningParameter
updateProvisioningParameter =
    UpdateProvisioningParameter'
    { _uppValue = Nothing
    , _uppKey = Nothing
    , _uppUsePreviousValue = Nothing
    }

-- | The value to use for updating the product provisioning. Any constraints on this value can be found in the 'ProvisioningArtifactParameter' parameter for 'Key'.
uppValue :: Lens' UpdateProvisioningParameter (Maybe Text)
uppValue = lens _uppValue (\ s a -> s{_uppValue = a});

-- | The 'ProvisioningArtifactParameter.ParameterKey' parameter from < DescribeProvisioningParameters>.
uppKey :: Lens' UpdateProvisioningParameter (Maybe Text)
uppKey = lens _uppKey (\ s a -> s{_uppKey = a});

-- | If true, uses the currently set value for 'Key', ignoring 'UpdateProvisioningParameter.Value'.
uppUsePreviousValue :: Lens' UpdateProvisioningParameter (Maybe Bool)
uppUsePreviousValue = lens _uppUsePreviousValue (\ s a -> s{_uppUsePreviousValue = a});

instance Hashable UpdateProvisioningParameter

instance NFData UpdateProvisioningParameter

instance ToJSON UpdateProvisioningParameter where
        toJSON UpdateProvisioningParameter'{..}
          = object
              (catMaybes
                 [("Value" .=) <$> _uppValue, ("Key" .=) <$> _uppKey,
                  ("UsePreviousValue" .=) <$> _uppUsePreviousValue])

-- | Additional information provided by the administrator.
--
-- /See:/ 'usageInstruction' smart constructor.
data UsageInstruction = UsageInstruction'
    { _uiValue :: !(Maybe Text)
    , _uiType  :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'UsageInstruction' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'uiValue'
--
-- * 'uiType'
usageInstruction
    :: UsageInstruction
usageInstruction =
    UsageInstruction'
    { _uiValue = Nothing
    , _uiType = Nothing
    }

-- | The usage instruction value for this type.
uiValue :: Lens' UsageInstruction (Maybe Text)
uiValue = lens _uiValue (\ s a -> s{_uiValue = a});

-- | The usage instruction type for the value.
uiType :: Lens' UsageInstruction (Maybe Text)
uiType = lens _uiType (\ s a -> s{_uiType = a});

instance FromJSON UsageInstruction where
        parseJSON
          = withObject "UsageInstruction"
              (\ x ->
                 UsageInstruction' <$>
                   (x .:? "Value") <*> (x .:? "Type"))

instance Hashable UsageInstruction

instance NFData UsageInstruction
