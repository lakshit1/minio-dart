import 'package:xml/xml.dart';

XmlElement getProp(XmlElement xml, String name) {
  final result = xml.findElements(name);
  return result.isNotEmpty ? result.first : null;
}

/// Specifies the days since the initiation of an incomplete multipart upload that Amazon S3 will wait before permanently removing all parts of the upload. For more information, see Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Policy in the Amazon Simple Storage Service Developer Guide.
class AbortIncompleteMultipartUpload {
  AbortIncompleteMultipartUpload.fromXml(XmlElement xml) {
    daysAfterInitiation =
        int.tryParse(getProp(xml, 'DaysAfterInitiation')?.text);
  }

  /// Specifies the number of days after which Amazon S3 aborts an incomplete multipart upload.
  int daysAfterInitiation;
}

/// Configures the transfer acceleration state for an Amazon S3 bucket. For more information, see Amazon S3 Transfer Acceleration in the Amazon Simple Storage Service Developer Guide.
class AccelerateConfiguration {
  AccelerateConfiguration.fromXml(XmlElement xml) {
    status = getProp(xml, 'Status')?.text;
  }

  /// Specifies the transfer acceleration status of the bucket.
  String status;
}

/// Contains the elements that set the ACL permissions for an object per grantee.
class AccessControlPolicy {
  AccessControlPolicy.fromXml(XmlElement xml) {
    grants = Grant.fromXml(getProp(xml, 'Grants'));
    owner = Owner.fromXml(getProp(xml, 'Owner'));
  }

  /// A list of grants.
  Grant grants;

  /// Container for the bucket owner's display name and ID.
  Owner owner;
}

/// A container for information about access control for replicas.
class AccessControlTranslation {
  AccessControlTranslation.fromXml(XmlElement xml) {
    owner = getProp(xml, 'Owner')?.text;
  }

  /// Specifies the replica ownership. For default and valid values, see PUT bucket replication in the Amazon Simple Storage Service API Reference.
  String owner;
}

/// A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The operator must have at least two predicates in any combination, and an object must match all of the predicates for the filter to apply.
class AnalyticsAndOperator {
  AnalyticsAndOperator.fromXml(XmlElement xml) {
    prefix = getProp(xml, 'Prefix')?.text;
    tags = Tag.fromXml(getProp(xml, 'Tags'));
  }

  /// The prefix to use when evaluating an AND predicate: The prefix that an object must have to be included in the metrics results.
  String prefix;

  /// The list of tags to use when evaluating an AND predicate.
  Tag tags;
}

///  Specifies the configuration and any analyses for the analytics filter of an Amazon S3 bucket.
class AnalyticsConfiguration {
  AnalyticsConfiguration.fromXml(XmlElement xml) {
    filter = AnalyticsFilter.fromXml(getProp(xml, 'Filter'));
    id = getProp(xml, 'Id')?.text;
    storageClassAnalysis =
        StorageClassAnalysis.fromXml(getProp(xml, 'StorageClassAnalysis'));
  }

  /// The filter used to describe a set of objects for analyses. A filter must have exactly one prefix, one tag, or one conjunction (AnalyticsAndOperator). If no filter is provided, all objects will be considered in any analysis.
  AnalyticsFilter filter;

  /// The ID that identifies the analytics configuration.
  String id;

  ///  Contains data related to access patterns to be collected and made available to analyze the tradeoffs between different storage classes.
  StorageClassAnalysis storageClassAnalysis;
}

/// Where to publish the analytics results.
class AnalyticsExportDestination {
  AnalyticsExportDestination.fromXml(XmlElement xml) {
    s3BucketDestination = AnalyticsS3BucketDestination.fromXml(
        getProp(xml, 'S3BucketDestination'));
  }

  /// A destination signifying output to an S3 bucket.
  AnalyticsS3BucketDestination s3BucketDestination;
}

/// The filter used to describe a set of objects for analyses. A filter must have exactly one prefix, one tag, or one conjunction (AnalyticsAndOperator). If no filter is provided, all objects will be considered in any analysis.
class AnalyticsFilter {
  AnalyticsFilter.fromXml(XmlElement xml) {
    and = AnalyticsAndOperator.fromXml(getProp(xml, 'And'));
    prefix = getProp(xml, 'Prefix')?.text;
    tag = Tag.fromXml(getProp(xml, 'Tag'));
  }

  /// A conjunction (logical AND) of predicates, which is used in evaluating an analytics filter. The operator must have at least two predicates.
  AnalyticsAndOperator and;

  /// The prefix to use when evaluating an analytics filter.
  String prefix;

  /// The tag to use when evaluating an analytics filter.
  Tag tag;
}

/// Contains information about where to publish the analytics results.
class AnalyticsS3BucketDestination {
  AnalyticsS3BucketDestination.fromXml(XmlElement xml) {
    bucket = getProp(xml, 'Bucket')?.text;
    bucketAccountId = getProp(xml, 'BucketAccountId')?.text;
    format = getProp(xml, 'Format')?.text;
    prefix = getProp(xml, 'Prefix')?.text;
  }

  /// The Amazon Resource Name (ARN) of the bucket to which data is exported.
  String bucket;

  /// The account ID that owns the destination bucket. If no account ID is provided, the owner will not be validated prior to exporting data.
  String bucketAccountId;

  /// Specifies the file format used when exporting data to Amazon S3.
  String format;

  /// The prefix to use when exporting data. The prefix is prepended to all results.
  String prefix;
}

///  In terms of implementation, a Bucket is a resource. An Amazon S3 bucket name is globally unique, and the namespace is shared by all AWS accounts.
class Bucket {
  Bucket.fromXml(XmlElement xml) {
    creationDate = DateTime.parse(getProp(xml, 'CreationDate')?.text);
    name = getProp(xml, 'Name')?.text;
  }

  /// Date the bucket was created.
  DateTime creationDate;

  /// The name of the bucket.
  String name;
}

/// Specifies the lifecycle configuration for objects in an Amazon S3 bucket. For more information, see Object Lifecycle Management in the Amazon Simple Storage Service Developer Guide.
class BucketLifecycleConfiguration {
  BucketLifecycleConfiguration.fromXml(XmlElement xml) {
    rules = LifecycleRule.fromXml(getProp(xml, 'Rules'));
  }

  /// A lifecycle rule for individual objects in an Amazon S3 bucket.
  LifecycleRule rules;
}

/// Container for logging status information.
class BucketLoggingStatus {
  BucketLoggingStatus.fromXml(XmlElement xml) {
    loggingEnabled = LoggingEnabled.fromXml(getProp(xml, 'LoggingEnabled'));
  }

  /// Describes where logs are stored and the prefix that Amazon S3 assigns to all log object keys for a bucket. For more information, see PUT Bucket logging in the Amazon Simple Storage Service API Reference.
  LoggingEnabled loggingEnabled;
}

/// Container for specifying the AWS Lambda notification configuration.
class CloudFunctionConfiguration {
  CloudFunctionConfiguration.fromXml(XmlElement xml) {
    cloudFunction = getProp(xml, 'CloudFunction')?.text;
    event = getProp(xml, 'Event')?.text;
    events = getProp(xml, 'Events')?.text;
    id = getProp(xml, 'Id')?.text;
    invocationRole = getProp(xml, 'InvocationRole')?.text;
  }

  /// Lambda cloud function ARN that Amazon S3 can invoke when it detects events of the specified type.
  String cloudFunction;

  ///  This member has been deprecated.
  String event;

  /// Bucket events for which to send notifications.
  String events;

  /// An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.
  String id;

  /// The role supporting the invocation of the Lambda function
  String invocationRole;
}

/// Container for all (if there are any) keys between Prefix and the next occurrence of the string specified by a delimiter. CommonPrefixes lists keys that act like subdirectories in the directory specified by Prefix. For example, if the prefix is notes/ and the delimiter is a slash (/) as in notes/summer/july, the common prefix is notes/summer/.
class CommonPrefix {
  CommonPrefix.fromXml(XmlElement xml) {
    prefix = getProp(xml, 'Prefix')?.text;
  }

  /// Container for the specified common prefix.
  String prefix;
}

/// The container for the completed multipart upload details.
class CompletedMultipartUpload {
  CompletedMultipartUpload.fromXml(XmlElement xml) {
    parts = CompletedPart.fromXml(getProp(xml, 'Parts'));
  }

  /// Array of CompletedPart data types.
  CompletedPart parts;
}

/// Details of the parts that were uploaded.
class CompletedPart {
  CompletedPart.fromXml(XmlElement xml) {
    eTag = getProp(xml, 'ETag')?.text;
    partNumber = int.tryParse(getProp(xml, 'PartNumber')?.text);
  }

  /// Entity tag returned when the part was uploaded.
  String eTag;

  /// Part number that identifies the part. This is a positive integer between 1 and 10,000.
  int partNumber;
}

/// A container for describing a condition that must be met for the specified redirect to apply. For example, 1. If request is for pages in the /docs folder, redirect to the /documents folder. 2. If request results in HTTP error 4xx, redirect request to another host where you might process the error.
class Condition {
  Condition.fromXml(XmlElement xml) {
    httpErrorCodeReturnedEquals =
        getProp(xml, 'HttpErrorCodeReturnedEquals')?.text;
    keyPrefixEquals = getProp(xml, 'KeyPrefixEquals')?.text;
  }

  /// The HTTP error code when the redirect is applied. In the event of an error, if the error code equals this value, then the specified redirect is applied. Required when parent element Condition is specified and sibling KeyPrefixEquals is not specified. If both are specified, then both must be true for the redirect to be applied.
  String httpErrorCodeReturnedEquals;

  /// The object key name prefix when the redirect is applied. For example, to redirect requests for ExamplePage.html, the key prefix will be ExamplePage.html. To redirect request for all pages with the prefix docs/, the key prefix will be /docs, which identifies all objects in the docs/ folder. Required when the parent element Condition is specified and sibling HttpErrorCodeReturnedEquals is not specified. If both conditions are specified, both must be true for the redirect to be applied.
  String keyPrefixEquals;
}

/// The members of this structure are context-dependent.
class ContinuationEvent {
  ContinuationEvent.fromXml(XmlElement xml) {}
}

/// Container for all response elements.
class CopyObjectResult {
  CopyObjectResult.fromXml(XmlElement xml) {
    eTag = getProp(xml, 'ETag')?.text;
    lastModified = DateTime.parse(getProp(xml, 'LastModified')?.text);
  }

  /// Returns the ETag of the new object. The ETag reflects only changes to the contents of an object, not its metadata. The source and destination ETag is identical for a successfully copied object.
  String eTag;

  /// Returns the date that the object was last modified.
  DateTime lastModified;
}

/// Container for all response elements.
class CopyPartResult {
  CopyPartResult.fromXml(XmlElement xml) {
    eTag = getProp(xml, 'ETag')?.text;
    lastModified = DateTime.parse(getProp(xml, 'LastModified')?.text);
  }

  /// Entity tag of the object.
  String eTag;

  /// Date and time at which the object was uploaded.
  DateTime lastModified;
}

/// Describes the cross-origin access configuration for objects in an Amazon S3 bucket. For more information, see Enabling Cross-Origin Resource Sharing in the Amazon Simple Storage Service Developer Guide.
class CORSConfiguration {
  CORSConfiguration.fromXml(XmlElement xml) {
    cORSRules = CORSRule.fromXml(getProp(xml, 'CORSRules'));
  }

  /// A set of origins and methods (cross-origin access that you want to allow). You can add up to 100 rules to the configuration.
  CORSRule cORSRules;
}

/// Specifies a cross-origin access rule for an Amazon S3 bucket.
class CORSRule {
  CORSRule.fromXml(XmlElement xml) {
    allowedHeaders = getProp(xml, 'AllowedHeaders')?.text;
    allowedMethods = getProp(xml, 'AllowedMethods')?.text;
    allowedOrigins = getProp(xml, 'AllowedOrigins')?.text;
    exposeHeaders = getProp(xml, 'ExposeHeaders')?.text;
    maxAgeSeconds = int.tryParse(getProp(xml, 'MaxAgeSeconds')?.text);
  }

  /// Headers that are specified in the Access-Control-Request-Headers header. These headers are allowed in a preflight OPTIONS request. In response to any preflight OPTIONS request, Amazon S3 returns any requested headers that are allowed.
  String allowedHeaders;

  /// An HTTP method that you allow the origin to execute. Valid values are GET, PUT, HEAD, POST, and DELETE.
  String allowedMethods;

  /// One or more origins you want customers to be able to access the bucket from.
  String allowedOrigins;

  /// One or more headers in the response that you want customers to be able to access from their applications (for example, from a JavaScript XMLHttpRequest object).
  String exposeHeaders;

  /// The time in seconds that your browser is to cache the preflight response for the specified resource.
  int maxAgeSeconds;
}

/// The configuration information for the bucket.
class CreateBucketConfiguration {
  CreateBucketConfiguration.fromXml(XmlElement xml) {
    locationConstraint = getProp(xml, 'LocationConstraint')?.text;
  }

  /// Specifies the Region where the bucket will be created. If you don't specify a Region, the bucket is created in the US East (N. Virginia) Region (us-east-1).
  String locationConstraint;
}

/// Describes how an uncompressed comma-separated values (CSV)-formatted input object is formatted.
class CSVInput {
  CSVInput.fromXml(XmlElement xml) {
    allowQuotedRecordDelimiter =
        getProp(xml, 'AllowQuotedRecordDelimiter')?.text == 'TRUE';
    comments = getProp(xml, 'Comments')?.text;
    fieldDelimiter = getProp(xml, 'FieldDelimiter')?.text;
    fileHeaderInfo = getProp(xml, 'FileHeaderInfo')?.text;
    quoteCharacter = getProp(xml, 'QuoteCharacter')?.text;
    quoteEscapeCharacter = getProp(xml, 'QuoteEscapeCharacter')?.text;
    recordDelimiter = getProp(xml, 'RecordDelimiter')?.text;
  }

  /// Specifies that CSV field values may contain quoted record delimiters and such records should be allowed. Default value is FALSE. Setting this value to TRUE may lower performance.
  bool allowQuotedRecordDelimiter;

  /// A single character used to indicate that a row should be ignored when the character is present at the start of that row. You can specify any character to indicate a comment line.
  String comments;

  /// A single character used to separate individual fields in a record. You can specify an arbitrary delimiter.
  String fieldDelimiter;

  /// Describes the first line of input. Valid values are:
  String fileHeaderInfo;

  /// A single character used for escaping when the field delimiter is part of the value. For example, if the value is a, b, Amazon S3 wraps this field value in quotation marks, as follows: " a , b ".
  String quoteCharacter;

  /// A single character used for escaping the quotation mark character inside an already escaped value. For example, the value """ a , b """ is parsed as " a , b ".
  String quoteEscapeCharacter;

  /// A single character used to separate individual records in the input. Instead of the default value, you can specify an arbitrary delimiter.
  String recordDelimiter;
}

/// Describes how uncompressed comma-separated values (CSV)-formatted results are formatted.
class CSVOutput {
  CSVOutput.fromXml(XmlElement xml) {
    fieldDelimiter = getProp(xml, 'FieldDelimiter')?.text;
    quoteCharacter = getProp(xml, 'QuoteCharacter')?.text;
    quoteEscapeCharacter = getProp(xml, 'QuoteEscapeCharacter')?.text;
    quoteFields = getProp(xml, 'QuoteFields')?.text;
    recordDelimiter = getProp(xml, 'RecordDelimiter')?.text;
  }

  /// The value used to separate individual fields in a record. You can specify an arbitrary delimiter.
  String fieldDelimiter;

  /// A single character used for escaping when the field delimiter is part of the value. For example, if the value is a, b, Amazon S3 wraps this field value in quotation marks, as follows: " a , b ".
  String quoteCharacter;

  /// The single character used for escaping the quote character inside an already escaped value.
  String quoteEscapeCharacter;

  /// Indicates whether to use quotation marks around output fields.
  String quoteFields;

  /// A single character used to separate individual records in the output. Instead of the default value, you can specify an arbitrary delimiter.
  String recordDelimiter;
}

/// The container element for specifying the default Object Lock retention settings for new objects placed in the specified bucket.
class DefaultRetention {
  DefaultRetention.fromXml(XmlElement xml) {
    days = int.tryParse(getProp(xml, 'Days')?.text);
    mode = getProp(xml, 'Mode')?.text;
    years = int.tryParse(getProp(xml, 'Years')?.text);
  }

  /// The number of days that you want to specify for the default retention period.
  int days;

  /// The default Object Lock retention mode you want to apply to new objects placed in the specified bucket.
  String mode;

  /// The number of years that you want to specify for the default retention period.
  int years;
}

/// Container for the objects to delete.
class Delete {
  Delete.fromXml(XmlElement xml) {
    objects = ObjectIdentifier.fromXml(getProp(xml, 'Objects'));
    quiet = getProp(xml, 'Quiet')?.text == 'TRUE';
  }

  /// The objects to delete.
  ObjectIdentifier objects;

  /// Element to enable quiet mode for the request. When you add this element, you must set its value to true.
  bool quiet;
}

/// Information about the deleted object.
class DeletedObject {
  DeletedObject.fromXml(XmlElement xml) {
    deleteMarker = getProp(xml, 'DeleteMarker')?.text == 'TRUE';
    deleteMarkerVersionId = getProp(xml, 'DeleteMarkerVersionId')?.text;
    key = getProp(xml, 'Key')?.text;
    versionId = getProp(xml, 'VersionId')?.text;
  }

  /// Specifies whether the versioned object that was permanently deleted was (true) or was not (false) a delete marker. In a simple DELETE, this header indicates whether (true) or not (false) a delete marker was created.
  bool deleteMarker;

  /// The version ID of the delete marker created as a result of the DELETE operation. If you delete a specific object version, the value returned by this header is the version ID of the object version deleted.
  String deleteMarkerVersionId;

  /// The name of the deleted object.
  String key;

  /// The version ID of the deleted object.
  String versionId;
}

/// Information about the delete marker.
class DeleteMarkerEntry {
  DeleteMarkerEntry.fromXml(XmlElement xml) {
    isLatest = getProp(xml, 'IsLatest')?.text == 'TRUE';
    key = getProp(xml, 'Key')?.text;
    lastModified = DateTime.parse(getProp(xml, 'LastModified')?.text);
    owner = Owner.fromXml(getProp(xml, 'Owner'));
    versionId = getProp(xml, 'VersionId')?.text;
  }

  /// Specifies whether the object is (true) or is not (false) the latest version of an object.
  bool isLatest;

  /// The object key.
  String key;

  /// Date and time the object was last modified.
  DateTime lastModified;

  /// The account that created the delete marker.>
  Owner owner;

  /// Version ID of an object.
  String versionId;
}

/// Specifies whether Amazon S3 replicates the delete markers. If you specify a Filter, you must specify this element. However, in the latest version of replication configuration (when Filter is specified), Amazon S3 doesn't replicate delete markers. Therefore, the DeleteMarkerReplication element can contain only <Status>Disabled</Status>. For an example configuration, see Basic Rule Configuration.
class DeleteMarkerReplication {
  DeleteMarkerReplication.fromXml(XmlElement xml) {
    status = getProp(xml, 'Status')?.text;
  }

  /// Indicates whether to replicate delete markers.
  String status;
}

/// Specifies information about where to publish analysis or configuration results for an Amazon S3 bucket and S3 Replication Time Control (S3 RTC).
class Destination {
  Destination.fromXml(XmlElement xml) {
    accessControlTranslation = AccessControlTranslation.fromXml(
        getProp(xml, 'AccessControlTranslation'));
    account = getProp(xml, 'Account')?.text;
    bucket = getProp(xml, 'Bucket')?.text;
    encryptionConfiguration = EncryptionConfiguration.fromXml(
        getProp(xml, 'EncryptionConfiguration'));
    metrics = Metrics.fromXml(getProp(xml, 'Metrics'));
    replicationTime = ReplicationTime.fromXml(getProp(xml, 'ReplicationTime'));
    storageClass = getProp(xml, 'StorageClass')?.text;
  }

  /// Specify this only in a cross-account scenario (where source and destination bucket owners are not the same), and you want to change replica ownership to the AWS account that owns the destination bucket. If this is not specified in the replication configuration, the replicas are owned by same AWS account that owns the source object.
  AccessControlTranslation accessControlTranslation;

  /// Destination bucket owner account ID. In a cross-account scenario, if you direct Amazon S3 to change replica ownership to the AWS account that owns the destination bucket by specifying the AccessControlTranslation property, this is the account ID of the destination bucket owner. For more information, see Replication Additional Configuration: Changing the Replica Owner in the Amazon Simple Storage Service Developer Guide.
  String account;

  ///  The Amazon Resource Name (ARN) of the bucket where you want Amazon S3 to store the results.
  String bucket;

  /// A container that provides information about encryption. If SourceSelectionCriteria is specified, you must specify this element.
  EncryptionConfiguration encryptionConfiguration;

  ///  A container specifying replication metrics-related settings enabling metrics and Amazon S3 events for S3 Replication Time Control (S3 RTC). Must be specified together with a ReplicationTime block.
  Metrics metrics;

  ///  A container specifying S3 Replication Time Control (S3 RTC), including whether S3 RTC is enabled and the time when all objects and operations on objects must be replicated. Must be specified together with a Metrics block.
  ReplicationTime replicationTime;

  ///  The storage class to use when replicating objects, such as S3 Standard or reduced redundancy. By default, Amazon S3 uses the storage class of the source object to create the object replica.
  String storageClass;
}

/// Contains the type of server-side encryption used.
class Encryption {
  Encryption.fromXml(XmlElement xml) {
    encryptionType = getProp(xml, 'EncryptionType')?.text;
    kMSContext = getProp(xml, 'KMSContext')?.text;
    kMSKeyId = getProp(xml, 'KMSKeyId')?.text;
  }

  /// The server-side encryption algorithm used when storing job results in Amazon S3 (for example, AES256, aws:kms).
  String encryptionType;

  /// If the encryption type is aws:kms, this optional value can be used to specify the encryption context for the restore results.
  String kMSContext;

  /// If the encryption type is aws:kms, this optional value specifies the ID of the symmetric customer managed AWS KMS CMK to use for encryption of job results. Amazon S3 only supports symmetric CMKs. For more information, see Using Symmetric and Asymmetric Keys in the AWS Key Management Service Developer Guide.
  String kMSKeyId;
}

/// Specifies encryption-related information for an Amazon S3 bucket that is a destination for replicated objects.
class EncryptionConfiguration {
  EncryptionConfiguration.fromXml(XmlElement xml) {
    replicaKmsKeyID = getProp(xml, 'ReplicaKmsKeyID')?.text;
  }

  /// Specifies the ID (Key ARN or Alias ARN) of the customer managed customer master key (CMK) stored in AWS Key Management Service (KMS) for the destination bucket. Amazon S3 uses this key to encrypt replica objects. Amazon S3 only supports symmetric customer managed CMKs. For more information, see Using Symmetric and Asymmetric Keys in the AWS Key Management Service Developer Guide.
  String replicaKmsKeyID;
}

/// A message that indicates the request is complete and no more messages will be sent. You should not assume that the request is complete until the client receives an EndEvent.
class EndEvent {
  EndEvent.fromXml(XmlElement xml) {}
}

/// Container for all error elements.
class Error {
  Error.fromXml(XmlElement xml) {
    code = getProp(xml, 'Code')?.text;
    key = getProp(xml, 'Key')?.text;
    message = getProp(xml, 'Message')?.text;
    versionId = getProp(xml, 'VersionId')?.text;
  }

  /// The error code is a string that uniquely identifies an error condition. It is meant to be read and understood by programs that detect and handle errors by type.
  String code;

  /// The error key.
  String key;

  /// The error message contains a generic description of the error condition in English. It is intended for a human audience. Simple programs display the message directly to the end user if they encounter an error condition they don't know how or don't care to handle. Sophisticated programs with more exhaustive error handling and proper internationalization are more likely to ignore the error message.
  String message;

  /// The version ID of the error.
  String versionId;
}

/// The error information.
class ErrorDocument {
  ErrorDocument.fromXml(XmlElement xml) {
    key = getProp(xml, 'Key')?.text;
  }

  /// The object key name to use when a 4XX class error occurs.
  String key;
}

/// Optional configuration to replicate existing source bucket objects. For more information, see Replicating Existing Objects in the Amazon S3 Developer Guide.
class ExistingObjectReplication {
  ExistingObjectReplication.fromXml(XmlElement xml) {
    status = getProp(xml, 'Status')?.text;
  }

  /// Type: String
  String status;
}

/// Specifies the Amazon S3 object key name to filter on and whether to filter on the suffix or prefix of the key name.
class FilterRule {
  FilterRule.fromXml(XmlElement xml) {
    name = getProp(xml, 'Name')?.text;
    value = getProp(xml, 'Value')?.text;
  }

  /// The object key name prefix or suffix identifying one or more objects to which the filtering rule applies. The maximum length is 1,024 characters. Overlapping prefixes and suffixes are not supported. For more information, see Configuring Event Notifications in the Amazon Simple Storage Service Developer Guide.
  String name;

  /// The value that the filter searches for in object key names.
  String value;
}

/// Container for S3 Glacier job parameters.
class GlacierJobParameters {
  GlacierJobParameters.fromXml(XmlElement xml) {
    tier = getProp(xml, 'Tier')?.text;
  }

  /// S3 Glacier retrieval tier at which the restore will be processed.
  String tier;
}

/// Container for grant information.
class Grant {
  Grant.fromXml(XmlElement xml) {
    grantee = Grantee.fromXml(getProp(xml, 'Grantee'));
    permission = getProp(xml, 'Permission')?.text;
  }

  /// The person being granted permissions.
  Grantee grantee;

  /// Specifies the permission given to the grantee.
  String permission;
}

/// Container for the person being granted permissions.
class Grantee {
  Grantee.fromXml(XmlElement xml) {
    displayName = getProp(xml, 'DisplayName')?.text;
    emailAddress = getProp(xml, 'EmailAddress')?.text;
    iD = getProp(xml, 'ID')?.text;
    type = getProp(xml, 'Type')?.text;
    uRI = getProp(xml, 'URI')?.text;
  }

  /// Screen name of the grantee.
  String displayName;

  /// Email address of the grantee.
  String emailAddress;

  /// The canonical user ID of the grantee.
  String iD;

  /// Type of grantee
  String type;

  /// URI of the grantee group.
  String uRI;
}

/// Container for the Suffix element.
class IndexDocument {
  IndexDocument.fromXml(XmlElement xml) {
    suffix = getProp(xml, 'Suffix')?.text;
  }

  /// A suffix that is appended to a request that is for a directory on the website endpoint (for example,if the suffix is index.html and you make a request to samplebucket/images/ the data that is returned will be for the object with the key name images/index.html) The suffix must not be empty and must not include a slash character.
  String suffix;
}

/// Container element that identifies who initiated the multipart upload.
class Initiator {
  Initiator.fromXml(XmlElement xml) {
    displayName = getProp(xml, 'DisplayName')?.text;
    iD = getProp(xml, 'ID')?.text;
  }

  /// Name of the Principal.
  String displayName;

  /// If the principal is an AWS account, it provides the Canonical User ID. If the principal is an IAM User, it provides a user ARN value.
  String iD;
}

/// Describes the serialization format of the object.
class InputSerialization {
  InputSerialization.fromXml(XmlElement xml) {
    compressionType = getProp(xml, 'CompressionType')?.text;
    cSV = CSVInput.fromXml(getProp(xml, 'CSV'));
    jSON = JSONInput.fromXml(getProp(xml, 'JSON'));
    parquet = ParquetInput.fromXml(getProp(xml, 'Parquet'));
  }

  /// Specifies object's compression format. Valid values: NONE, GZIP, BZIP2. Default Value: NONE.
  String compressionType;

  /// Describes the serialization of a CSV-encoded object.
  CSVInput cSV;

  /// Specifies JSON as object's input serialization format.
  JSONInput jSON;

  /// Specifies Parquet as object's input serialization format.
  ParquetInput parquet;
}

/// Specifies the inventory configuration for an Amazon S3 bucket. For more information, see GET Bucket inventory in the Amazon Simple Storage Service API Reference.
class InventoryConfiguration {
  InventoryConfiguration.fromXml(XmlElement xml) {
    destination = InventoryDestination.fromXml(getProp(xml, 'Destination'));
    filter = InventoryFilter.fromXml(getProp(xml, 'Filter'));
    id = getProp(xml, 'Id')?.text;
    includedObjectVersions = getProp(xml, 'IncludedObjectVersions')?.text;
    isEnabled = getProp(xml, 'IsEnabled')?.text == 'TRUE';
    optionalFields = getProp(xml, 'OptionalFields')?.text;
    schedule = InventorySchedule.fromXml(getProp(xml, 'Schedule'));
  }

  /// Contains information about where to publish the inventory results.
  InventoryDestination destination;

  /// Specifies an inventory filter. The inventory only includes objects that meet the filter's criteria.
  InventoryFilter filter;

  /// The ID used to identify the inventory configuration.
  String id;

  /// Object versions to include in the inventory list. If set to All, the list includes all the object versions, which adds the version-related fields VersionId, IsLatest, and DeleteMarker to the list. If set to Current, the list does not contain these version-related fields.
  String includedObjectVersions;

  /// Specifies whether the inventory is enabled or disabled. If set to True, an inventory list is generated. If set to False, no inventory list is generated.
  bool isEnabled;

  /// Contains the optional fields that are included in the inventory results.
  String optionalFields;

  /// Specifies the schedule for generating inventory results.
  InventorySchedule schedule;
}

/// Specifies the inventory configuration for an Amazon S3 bucket.
class InventoryDestination {
  InventoryDestination.fromXml(XmlElement xml) {
    s3BucketDestination = InventoryS3BucketDestination.fromXml(
        getProp(xml, 'S3BucketDestination'));
  }

  /// Contains the bucket name, file format, bucket owner (optional), and prefix (optional) where inventory results are published.
  InventoryS3BucketDestination s3BucketDestination;
}

/// Contains the type of server-side encryption used to encrypt the inventory results.
class InventoryEncryption {
  InventoryEncryption.fromXml(XmlElement xml) {
    sSEKMS = SSEKMS.fromXml(getProp(xml, 'SSEKMS'));
    sSES3 = SSES3.fromXml(getProp(xml, 'SSES3'));
  }

  /// Specifies the use of SSE-KMS to encrypt delivered inventory reports.
  SSEKMS sSEKMS;

  /// Specifies the use of SSE-S3 to encrypt delivered inventory reports.
  SSES3 sSES3;
}

/// Specifies an inventory filter. The inventory only includes objects that meet the filter's criteria.
class InventoryFilter {
  InventoryFilter.fromXml(XmlElement xml) {
    prefix = getProp(xml, 'Prefix')?.text;
  }

  /// The prefix that an object must have to be included in the inventory results.
  String prefix;
}

/// Contains the bucket name, file format, bucket owner (optional), and prefix (optional) where inventory results are published.
class InventoryS3BucketDestination {
  InventoryS3BucketDestination.fromXml(XmlElement xml) {
    accountId = getProp(xml, 'AccountId')?.text;
    bucket = getProp(xml, 'Bucket')?.text;
    encryption = InventoryEncryption.fromXml(getProp(xml, 'Encryption'));
    format = getProp(xml, 'Format')?.text;
    prefix = getProp(xml, 'Prefix')?.text;
  }

  /// The ID of the account that owns the destination bucket. Although optional, we recommend that the value be set to prevent problems if the destination bucket ownership changes.
  String accountId;

  /// The Amazon Resource Name (ARN) of the bucket where inventory results will be published.
  String bucket;

  /// Contains the type of server-side encryption used to encrypt the inventory results.
  InventoryEncryption encryption;

  /// Specifies the output format of the inventory results.
  String format;

  /// The prefix that is prepended to all inventory results.
  String prefix;
}

/// Specifies the schedule for generating inventory results.
class InventorySchedule {
  InventorySchedule.fromXml(XmlElement xml) {
    frequency = getProp(xml, 'Frequency')?.text;
  }

  /// Specifies how frequently inventory results are produced.
  String frequency;
}

/// Specifies JSON as object's input serialization format.
class JSONInput {
  JSONInput.fromXml(XmlElement xml) {
    type = getProp(xml, 'Type')?.text;
  }

  /// The type of JSON. Valid values: Document, Lines.
  String type;
}

/// Specifies JSON as request's output serialization format.
class JSONOutput {
  JSONOutput.fromXml(XmlElement xml) {
    recordDelimiter = getProp(xml, 'RecordDelimiter')?.text;
  }

  /// The value used to separate individual records in the output.
  String recordDelimiter;
}

/// A container for specifying the configuration for AWS Lambda notifications.
class LambdaFunctionConfiguration {
  LambdaFunctionConfiguration.fromXml(XmlElement xml) {
    events = getProp(xml, 'Events')?.text;
    filter = NotificationConfigurationFilter.fromXml(getProp(xml, 'Filter'));
    id = getProp(xml, 'Id')?.text;
    lambdaFunctionArn = getProp(xml, 'LambdaFunctionArn')?.text;
  }

  /// The Amazon S3 bucket event for which to invoke the AWS Lambda function. For more information, see Supported Event Types in the Amazon Simple Storage Service Developer Guide.
  String events;

  /// Specifies object key name filtering rules. For information about key name filtering, see Configuring Event Notifications in the Amazon Simple Storage Service Developer Guide.
  NotificationConfigurationFilter filter;

  /// An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.
  String id;

  /// The Amazon Resource Name (ARN) of the AWS Lambda function that Amazon S3 invokes when the specified event type occurs.
  String lambdaFunctionArn;
}

/// Container for lifecycle rules. You can add as many as 1000 rules.
class LifecycleConfiguration {
  LifecycleConfiguration.fromXml(XmlElement xml) {
    rules = Rule.fromXml(getProp(xml, 'Rules'));
  }

  /// Specifies lifecycle configuration rules for an Amazon S3 bucket.
  Rule rules;
}

/// Container for the expiration for the lifecycle of the object.
class LifecycleExpiration {
  LifecycleExpiration.fromXml(XmlElement xml) {
    date = DateTime.parse(getProp(xml, 'Date')?.text);
    days = int.tryParse(getProp(xml, 'Days')?.text);
    expiredObjectDeleteMarker =
        getProp(xml, 'ExpiredObjectDeleteMarker')?.text == 'TRUE';
  }

  /// Indicates at what date the object is to be moved or deleted. Should be in GMT ISO 8601 Format.
  DateTime date;

  /// Indicates the lifetime, in days, of the objects that are subject to the rule. The value must be a non-zero positive integer.
  int days;

  /// Indicates whether Amazon S3 will remove a delete marker with no noncurrent versions. If set to true, the delete marker will be expired; if set to false the policy takes no action. This cannot be specified with Days or Date in a Lifecycle Expiration Policy.
  bool expiredObjectDeleteMarker;
}

/// A lifecycle rule for individual objects in an Amazon S3 bucket.
class LifecycleRule {
  LifecycleRule.fromXml(XmlElement xml) {
    abortIncompleteMultipartUpload = AbortIncompleteMultipartUpload.fromXml(
        getProp(xml, 'AbortIncompleteMultipartUpload'));
    expiration = LifecycleExpiration.fromXml(getProp(xml, 'Expiration'));
    filter = LifecycleRuleFilter.fromXml(getProp(xml, 'Filter'));
    iD = getProp(xml, 'ID')?.text;
    noncurrentVersionExpiration = NoncurrentVersionExpiration.fromXml(
        getProp(xml, 'NoncurrentVersionExpiration'));
    noncurrentVersionTransitions = NoncurrentVersionTransition.fromXml(
        getProp(xml, 'NoncurrentVersionTransitions'));
    prefix = getProp(xml, 'Prefix')?.text;
    status = getProp(xml, 'Status')?.text;
    transitions = Transition.fromXml(getProp(xml, 'Transitions'));
  }

  /// Specifies the days since the initiation of an incomplete multipart upload that Amazon S3 will wait before permanently removing all parts of the upload. For more information, see Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Policy in the Amazon Simple Storage Service Developer Guide.
  AbortIncompleteMultipartUpload abortIncompleteMultipartUpload;

  /// Specifies the expiration for the lifecycle of the object in the form of date, days and, whether the object has a delete marker.
  LifecycleExpiration expiration;

  /// The Filter is used to identify objects that a Lifecycle Rule applies to. A Filter must have exactly one of Prefix, Tag, or And specified.
  LifecycleRuleFilter filter;

  /// Unique identifier for the rule. The value cannot be longer than 255 characters.
  String iD;

  /// Specifies when noncurrent object versions expire. Upon expiration, Amazon S3 permanently deletes the noncurrent object versions. You set this lifecycle configuration action on a bucket that has versioning enabled (or suspended) to request that Amazon S3 delete noncurrent object versions at a specific period in the object's lifetime.
  NoncurrentVersionExpiration noncurrentVersionExpiration;

  ///  Specifies the transition rule for the lifecycle rule that describes when noncurrent objects transition to a specific storage class. If your bucket is versioning-enabled (or versioning is suspended), you can set this action to request that Amazon S3 transition noncurrent object versions to a specific storage class at a set period in the object's lifetime.
  NoncurrentVersionTransition noncurrentVersionTransitions;

  ///  This member has been deprecated.
  String prefix;

  /// If 'Enabled', the rule is currently being applied. If 'Disabled', the rule is not currently being applied.
  String status;

  /// Specifies when an Amazon S3 object transitions to a specified storage class.
  Transition transitions;
}

/// This is used in a Lifecycle Rule Filter to apply a logical AND to two or more predicates. The Lifecycle Rule will apply to any object matching all of the predicates configured inside the And operator.
class LifecycleRuleAndOperator {
  LifecycleRuleAndOperator.fromXml(XmlElement xml) {
    prefix = getProp(xml, 'Prefix')?.text;
    tags = Tag.fromXml(getProp(xml, 'Tags'));
  }

  /// Prefix identifying one or more objects to which the rule applies.
  String prefix;

  /// All of these tags must exist in the object's tag set in order for the rule to apply.
  Tag tags;
}

/// The Filter is used to identify objects that a Lifecycle Rule applies to. A Filter must have exactly one of Prefix, Tag, or And specified.
class LifecycleRuleFilter {
  LifecycleRuleFilter.fromXml(XmlElement xml) {
    and = LifecycleRuleAndOperator.fromXml(getProp(xml, 'And'));
    prefix = getProp(xml, 'Prefix')?.text;
    tag = Tag.fromXml(getProp(xml, 'Tag'));
  }

  /// This is used in a Lifecycle Rule Filter to apply a logical AND to two or more predicates. The Lifecycle Rule will apply to any object matching all of the predicates configured inside the And operator.
  LifecycleRuleAndOperator and;

  /// Prefix identifying one or more objects to which the rule applies.
  String prefix;

  /// This tag must exist in the object's tag set in order for the rule to apply.
  Tag tag;
}

/// Describes where logs are stored and the prefix that Amazon S3 assigns to all log object keys for a bucket. For more information, see PUT Bucket logging in the Amazon Simple Storage Service API Reference.
class LoggingEnabled {
  LoggingEnabled.fromXml(XmlElement xml) {
    targetBucket = getProp(xml, 'TargetBucket')?.text;
    targetGrants = TargetGrant.fromXml(getProp(xml, 'TargetGrants'));
    targetPrefix = getProp(xml, 'TargetPrefix')?.text;
  }

  /// Specifies the bucket where you want Amazon S3 to store server access logs. You can have your logs delivered to any bucket that you own, including the same bucket that is being logged. You can also configure multiple buckets to deliver their logs to the same target bucket. In this case, you should choose a different TargetPrefix for each source bucket so that the delivered log files can be distinguished by key.
  String targetBucket;

  /// Container for granting information.
  TargetGrant targetGrants;

  /// A prefix for all log object keys. If you store log files from multiple Amazon S3 buckets in a single bucket, you can use a prefix to distinguish which log files came from which bucket.
  String targetPrefix;
}

/// A metadata key-value pair to store with an object.
class MetadataEntry {
  MetadataEntry.fromXml(XmlElement xml) {
    name = getProp(xml, 'Name')?.text;
    value = getProp(xml, 'Value')?.text;
  }

  /// Name of the Object.
  String name;

  /// Value of the Object.
  String value;
}

///  A container specifying replication metrics-related settings enabling metrics and Amazon S3 events for S3 Replication Time Control (S3 RTC). Must be specified together with a ReplicationTime block.
class Metrics {
  Metrics.fromXml(XmlElement xml) {
    eventThreshold =
        ReplicationTimeValue.fromXml(getProp(xml, 'EventThreshold'));
    status = getProp(xml, 'Status')?.text;
  }

  ///  A container specifying the time threshold for emitting the s3:Replication:OperationMissedThreshold event.
  ReplicationTimeValue eventThreshold;

  ///  Specifies whether the replication metrics are enabled.
  String status;
}

/// A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The operator must have at least two predicates, and an object must match all of the predicates in order for the filter to apply.
class MetricsAndOperator {
  MetricsAndOperator.fromXml(XmlElement xml) {
    prefix = getProp(xml, 'Prefix')?.text;
    tags = Tag.fromXml(getProp(xml, 'Tags'));
  }

  /// The prefix used when evaluating an AND predicate.
  String prefix;

  /// The list of tags used when evaluating an AND predicate.
  Tag tags;
}

/// Specifies a metrics configuration for the CloudWatch request metrics (specified by the metrics configuration ID) from an Amazon S3 bucket. If you're updating an existing metrics configuration, note that this is a full replacement of the existing metrics configuration. If you don't include the elements you want to keep, they are erased. For more information, see PUT Bucket metrics in the Amazon Simple Storage Service API Reference.
class MetricsConfiguration {
  MetricsConfiguration.fromXml(XmlElement xml) {
    filter = MetricsFilter.fromXml(getProp(xml, 'Filter'));
    id = getProp(xml, 'Id')?.text;
  }

  /// Specifies a metrics configuration filter. The metrics configuration will only include objects that meet the filter's criteria. A filter must be a prefix, a tag, or a conjunction (MetricsAndOperator).
  MetricsFilter filter;

  /// The ID used to identify the metrics configuration.
  String id;
}

/// Specifies a metrics configuration filter. The metrics configuration only includes objects that meet the filter's criteria. A filter must be a prefix, a tag, or a conjunction (MetricsAndOperator).
class MetricsFilter {
  MetricsFilter.fromXml(XmlElement xml) {
    and = MetricsAndOperator.fromXml(getProp(xml, 'And'));
    prefix = getProp(xml, 'Prefix')?.text;
    tag = Tag.fromXml(getProp(xml, 'Tag'));
  }

  /// A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The operator must have at least two predicates, and an object must match all of the predicates in order for the filter to apply.
  MetricsAndOperator and;

  /// The prefix used when evaluating a metrics filter.
  String prefix;

  /// The tag used when evaluating a metrics filter.
  Tag tag;
}

/// Container for the MultipartUpload for the Amazon S3 object.
class MultipartUpload {
  MultipartUpload.fromXml(XmlElement xml) {
    initiated = DateTime.parse(getProp(xml, 'Initiated')?.text);
    initiator = Initiator.fromXml(getProp(xml, 'Initiator'));
    key = getProp(xml, 'Key')?.text;
    owner = Owner.fromXml(getProp(xml, 'Owner'));
    storageClass = getProp(xml, 'StorageClass')?.text;
    uploadId = getProp(xml, 'UploadId')?.text;
  }

  /// Date and time at which the multipart upload was initiated.
  DateTime initiated;

  /// Identifies who initiated the multipart upload.
  Initiator initiator;

  /// Key of the object for which the multipart upload was initiated.
  String key;

  /// Specifies the owner of the object that is part of the multipart upload.
  Owner owner;

  /// The class of storage used to store the object.
  String storageClass;

  /// Upload ID that identifies the multipart upload.
  String uploadId;
}

/// Specifies when noncurrent object versions expire. Upon expiration, Amazon S3 permanently deletes the noncurrent object versions. You set this lifecycle configuration action on a bucket that has versioning enabled (or suspended) to request that Amazon S3 delete noncurrent object versions at a specific period in the object's lifetime.
class NoncurrentVersionExpiration {
  NoncurrentVersionExpiration.fromXml(XmlElement xml) {
    noncurrentDays = int.tryParse(getProp(xml, 'NoncurrentDays')?.text);
  }

  /// Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated action. For information about the noncurrent days calculations, see How Amazon S3 Calculates When an Object Became Noncurrent in the Amazon Simple Storage Service Developer Guide.
  int noncurrentDays;
}

/// Container for the transition rule that describes when noncurrent objects transition to the STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, GLACIER, or DEEP_ARCHIVE storage class. If your bucket is versioning-enabled (or versioning is suspended), you can set this action to request that Amazon S3 transition noncurrent object versions to the STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, GLACIER, or DEEP_ARCHIVE storage class at a specific period in the object's lifetime.
class NoncurrentVersionTransition {
  NoncurrentVersionTransition.fromXml(XmlElement xml) {
    noncurrentDays = int.tryParse(getProp(xml, 'NoncurrentDays')?.text);
    storageClass = getProp(xml, 'StorageClass')?.text;
  }

  /// Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated action. For information about the noncurrent days calculations, see How Amazon S3 Calculates How Long an Object Has Been Noncurrent in the Amazon Simple Storage Service Developer Guide.
  int noncurrentDays;

  /// The class of storage used to store the object.
  String storageClass;
}

/// A container for specifying the notification configuration of the bucket. If this element is empty, notifications are turned off for the bucket.
class NotificationConfiguration {
  NotificationConfiguration.fromXml(XmlElement xml) {
    lambdaFunctionConfigurations = LambdaFunctionConfiguration.fromXml(
        getProp(xml, 'LambdaFunctionConfigurations'));
    queueConfigurations =
        QueueConfiguration.fromXml(getProp(xml, 'QueueConfigurations'));
    topicConfigurations =
        TopicConfiguration.fromXml(getProp(xml, 'TopicConfigurations'));
  }

  /// Describes the AWS Lambda functions to invoke and the events for which to invoke them.
  LambdaFunctionConfiguration lambdaFunctionConfigurations;

  /// The Amazon Simple Queue Service queues to publish messages to and the events for which to publish messages.
  QueueConfiguration queueConfigurations;

  /// The topic to which notifications are sent and the events for which notifications are generated.
  TopicConfiguration topicConfigurations;
}

/// Container for specifying the AWS Lambda notification configuration.
class NotificationConfigurationDeprecated {
  NotificationConfigurationDeprecated.fromXml(XmlElement xml) {
    cloudFunctionConfiguration = CloudFunctionConfiguration.fromXml(
        getProp(xml, 'CloudFunctionConfiguration'));
    queueConfiguration = QueueConfigurationDeprecated.fromXml(
        getProp(xml, 'QueueConfiguration'));
    topicConfiguration = TopicConfigurationDeprecated.fromXml(
        getProp(xml, 'TopicConfiguration'));
  }

  /// Container for specifying the AWS Lambda notification configuration.
  CloudFunctionConfiguration cloudFunctionConfiguration;

  /// This data type is deprecated. This data type specifies the configuration for publishing messages to an Amazon Simple Queue Service (Amazon SQS) queue when Amazon S3 detects specified events.
  QueueConfigurationDeprecated queueConfiguration;

  /// This data type is deprecated. A container for specifying the configuration for publication of messages to an Amazon Simple Notification Service (Amazon SNS) topic when Amazon S3 detects specified events.
  TopicConfigurationDeprecated topicConfiguration;
}

/// Specifies object key name filtering rules. For information about key name filtering, see Configuring Event Notifications in the Amazon Simple Storage Service Developer Guide.
class NotificationConfigurationFilter {
  NotificationConfigurationFilter.fromXml(XmlElement xml) {
    key = S3KeyFilter.fromXml(getProp(xml, 'Key'));
  }

  /// A container for object key name prefix and suffix filtering rules.
  S3KeyFilter key;
}

/// An object consists of data and its descriptive metadata.
class Object {
  Object.fromXml(XmlElement xml) {
    eTag = getProp(xml, 'ETag')?.text;
    key = getProp(xml, 'Key')?.text;
    lastModified = DateTime.parse(getProp(xml, 'LastModified')?.text);
    owner = Owner.fromXml(getProp(xml, 'Owner'));
    size = int.tryParse(getProp(xml, 'Size')?.text);
    storageClass = getProp(xml, 'StorageClass')?.text;
  }

  /// The entity tag is an MD5 hash of the object. ETag reflects only changes to the contents of an object, not its metadata.
  String eTag;

  /// The name that you assign to an object. You use the object key to retrieve the object.
  String key;

  /// The date the Object was Last Modified
  DateTime lastModified;

  /// The owner of the object
  Owner owner;

  /// Size in bytes of the object
  int size;

  /// The class of storage used to store the object.
  String storageClass;
}

/// Object Identifier is unique value to identify objects.
class ObjectIdentifier {
  ObjectIdentifier.fromXml(XmlElement xml) {
    key = getProp(xml, 'Key')?.text;
    versionId = getProp(xml, 'VersionId')?.text;
  }

  /// Key name of the object to delete.
  String key;

  /// VersionId for the specific version of the object to delete.
  String versionId;
}

/// The container element for Object Lock configuration parameters.
class ObjectLockConfiguration {
  ObjectLockConfiguration.fromXml(XmlElement xml) {
    objectLockEnabled = getProp(xml, 'ObjectLockEnabled')?.text;
    rule = ObjectLockRule.fromXml(getProp(xml, 'Rule'));
  }

  /// Indicates whether this bucket has an Object Lock configuration enabled.
  String objectLockEnabled;

  /// The Object Lock rule in place for the specified object.
  ObjectLockRule rule;
}

/// A Legal Hold configuration for an object.
class ObjectLockLegalHold {
  ObjectLockLegalHold.fromXml(XmlElement xml) {
    status = getProp(xml, 'Status')?.text;
  }

  /// Indicates whether the specified object has a Legal Hold in place.
  String status;
}

/// A Retention configuration for an object.
class ObjectLockRetention {
  ObjectLockRetention.fromXml(XmlElement xml) {
    mode = getProp(xml, 'Mode')?.text;
    retainUntilDate = DateTime.parse(getProp(xml, 'RetainUntilDate')?.text);
  }

  /// Indicates the Retention mode for the specified object.
  String mode;

  /// The date on which this Object Lock Retention will expire.
  DateTime retainUntilDate;
}

/// The container element for an Object Lock rule.
class ObjectLockRule {
  ObjectLockRule.fromXml(XmlElement xml) {
    defaultRetention =
        DefaultRetention.fromXml(getProp(xml, 'DefaultRetention'));
  }

  /// The default retention period that you want to apply to new objects placed in the specified bucket.
  DefaultRetention defaultRetention;
}

/// The version of an object.
class ObjectVersion {
  ObjectVersion.fromXml(XmlElement xml) {
    eTag = getProp(xml, 'ETag')?.text;
    isLatest = getProp(xml, 'IsLatest')?.text == 'TRUE';
    key = getProp(xml, 'Key')?.text;
    lastModified = DateTime.parse(getProp(xml, 'LastModified')?.text);
    owner = Owner.fromXml(getProp(xml, 'Owner'));
    size = int.tryParse(getProp(xml, 'Size')?.text);
    storageClass = getProp(xml, 'StorageClass')?.text;
    versionId = getProp(xml, 'VersionId')?.text;
  }

  /// The entity tag is an MD5 hash of that version of the object.
  String eTag;

  /// Specifies whether the object is (true) or is not (false) the latest version of an object.
  bool isLatest;

  /// The object key.
  String key;

  /// Date and time the object was last modified.
  DateTime lastModified;

  /// Specifies the owner of the object.
  Owner owner;

  /// Size in bytes of the object.
  int size;

  /// The class of storage used to store the object.
  String storageClass;

  /// Version ID of an object.
  String versionId;
}

/// Describes the location where the restore job's output is stored.
class OutputLocation {
  OutputLocation.fromXml(XmlElement xml) {
    s3 = S3Location.fromXml(getProp(xml, 'S3'));
  }

  /// Describes an S3 location that will receive the results of the restore request.
  S3Location s3;
}

/// Describes how results of the Select job are serialized.
class OutputSerialization {
  OutputSerialization.fromXml(XmlElement xml) {
    cSV = CSVOutput.fromXml(getProp(xml, 'CSV'));
    jSON = JSONOutput.fromXml(getProp(xml, 'JSON'));
  }

  /// Describes the serialization of CSV-encoded Select results.
  CSVOutput cSV;

  /// Specifies JSON as request's output serialization format.
  JSONOutput jSON;
}

/// Container for the owner's display name and ID.
class Owner {
  Owner.fromXml(XmlElement xml) {
    displayName = getProp(xml, 'DisplayName')?.text;
    iD = getProp(xml, 'ID')?.text;
  }

  /// Container for the display name of the owner.
  String displayName;

  /// Container for the ID of the owner.
  String iD;
}

/// Container for Parquet.
class ParquetInput {
  ParquetInput.fromXml(XmlElement xml) {}
}

/// Container for elements related to a part.
class Part {
  Part.fromXml(XmlElement xml) {
    eTag = getProp(xml, 'ETag')?.text;
    lastModified = DateTime.parse(getProp(xml, 'LastModified')?.text);
    partNumber = int.tryParse(getProp(xml, 'PartNumber')?.text);
    size = int.tryParse(getProp(xml, 'Size')?.text);
  }

  /// Entity tag returned when the part was uploaded.
  String eTag;

  /// Date and time at which the part was uploaded.
  DateTime lastModified;

  /// Part number identifying the part. This is a positive integer between 1 and 10,000.
  int partNumber;

  /// Size in bytes of the uploaded part data.
  int size;
}

/// The container element for a bucket's policy status.
class PolicyStatus {
  PolicyStatus.fromXml(XmlElement xml) {
    isPublic = getProp(xml, 'IsPublic')?.text == 'TRUE';
  }

  /// The policy status for this bucket. TRUE indicates that this bucket is public. FALSE indicates that the bucket is not public.
  bool isPublic;
}

/// This data type contains information about progress of an operation.
class Progress {
  Progress.fromXml(XmlElement xml) {
    bytesProcessed = int.tryParse(getProp(xml, 'BytesProcessed')?.text);
    bytesReturned = int.tryParse(getProp(xml, 'BytesReturned')?.text);
    bytesScanned = int.tryParse(getProp(xml, 'BytesScanned')?.text);
  }

  /// The current number of uncompressed object bytes processed.
  int bytesProcessed;

  /// The current number of bytes of records payload data returned.
  int bytesReturned;

  /// The current number of object bytes scanned.
  int bytesScanned;
}

/// This data type contains information about the progress event of an operation.
class ProgressEvent {
  ProgressEvent.fromXml(XmlElement xml) {
    details = Progress.fromXml(getProp(xml, 'Details'));
  }

  /// The Progress event details.
  Progress details;
}

/// The PublicAccessBlock configuration that you want to apply to this Amazon S3 bucket. You can enable the configuration options in any combination. For more information about when Amazon S3 considers a bucket or object public, see The Meaning of "Public" in the Amazon Simple Storage Service Developer Guide.
class PublicAccessBlockConfiguration {
  PublicAccessBlockConfiguration.fromXml(XmlElement xml) {
    blockPublicAcls = getProp(xml, 'BlockPublicAcls')?.text == 'TRUE';
    blockPublicPolicy = getProp(xml, 'BlockPublicPolicy')?.text == 'TRUE';
    ignorePublicAcls = getProp(xml, 'IgnorePublicAcls')?.text == 'TRUE';
    restrictPublicBuckets =
        getProp(xml, 'RestrictPublicBuckets')?.text == 'TRUE';
  }

  /// Specifies whether Amazon S3 should block public access control lists (ACLs) for this bucket and objects in this bucket. Setting this element to TRUE causes the following behavior:
  bool blockPublicAcls;

  /// Specifies whether Amazon S3 should block public bucket policies for this bucket. Setting this element to TRUE causes Amazon S3 to reject calls to PUT Bucket policy if the specified bucket policy allows public access.
  bool blockPublicPolicy;

  /// Specifies whether Amazon S3 should ignore public ACLs for this bucket and objects in this bucket. Setting this element to TRUE causes Amazon S3 to ignore all public ACLs on this bucket and objects in this bucket.
  bool ignorePublicAcls;

  /// Specifies whether Amazon S3 should restrict public bucket policies for this bucket. Setting this element to TRUE restricts access to this bucket to only AWS services and authorized users within this account if the bucket has a public policy.
  bool restrictPublicBuckets;
}

/// Specifies the configuration for publishing messages to an Amazon Simple Queue Service (Amazon SQS) queue when Amazon S3 detects specified events.
class QueueConfiguration {
  QueueConfiguration.fromXml(XmlElement xml) {
    events = getProp(xml, 'Events')?.text;
    filter = NotificationConfigurationFilter.fromXml(getProp(xml, 'Filter'));
    id = getProp(xml, 'Id')?.text;
    queueArn = getProp(xml, 'QueueArn')?.text;
  }

  /// A collection of bucket events for which to send notifications
  String events;

  /// Specifies object key name filtering rules. For information about key name filtering, see Configuring Event Notifications in the Amazon Simple Storage Service Developer Guide.
  NotificationConfigurationFilter filter;

  /// An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.
  String id;

  /// The Amazon Resource Name (ARN) of the Amazon SQS queue to which Amazon S3 publishes a message when it detects events of the specified type.
  String queueArn;
}

/// This data type is deprecated. Use QueueConfiguration for the same purposes. This data type specifies the configuration for publishing messages to an Amazon Simple Queue Service (Amazon SQS) queue when Amazon S3 detects specified events.
class QueueConfigurationDeprecated {
  QueueConfigurationDeprecated.fromXml(XmlElement xml) {
    event = getProp(xml, 'Event')?.text;
    events = getProp(xml, 'Events')?.text;
    id = getProp(xml, 'Id')?.text;
    queue = getProp(xml, 'Queue')?.text;
  }

  ///  This member has been deprecated.
  String event;

  /// A collection of bucket events for which to send notifications
  String events;

  /// An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.
  String id;

  /// The Amazon Resource Name (ARN) of the Amazon SQS queue to which Amazon S3 publishes a message when it detects events of the specified type.
  String queue;
}

/// The container for the records event.
class RecordsEvent {
  RecordsEvent.fromXml(XmlElement xml) {
    payload = getProp(xml, 'Payload')?.text;
  }

  /// The byte array of partial, one or more result records.
  String payload;
}

/// Specifies how requests are redirected. In the event of an error, you can specify a different error code to return.
class Redirect {
  Redirect.fromXml(XmlElement xml) {
    hostName = getProp(xml, 'HostName')?.text;
    httpRedirectCode = getProp(xml, 'HttpRedirectCode')?.text;
    protocol = getProp(xml, 'Protocol')?.text;
    replaceKeyPrefixWith = getProp(xml, 'ReplaceKeyPrefixWith')?.text;
    replaceKeyWith = getProp(xml, 'ReplaceKeyWith')?.text;
  }

  /// The host name to use in the redirect request.
  String hostName;

  /// The HTTP redirect code to use on the response. Not required if one of the siblings is present.
  String httpRedirectCode;

  /// Protocol to use when redirecting requests. The default is the protocol that is used in the original request.
  String protocol;

  /// The object key prefix to use in the redirect request. For example, to redirect requests for all pages with prefix docs/ (objects in the docs/ folder) to documents/, you can set a condition block with KeyPrefixEquals set to docs/ and in the Redirect set ReplaceKeyPrefixWith to /documents. Not required if one of the siblings is present. Can be present only if ReplaceKeyWith is not provided.
  String replaceKeyPrefixWith;

  /// The specific object key to use in the redirect request. For example, redirect request to error.html. Not required if one of the siblings is present. Can be present only if ReplaceKeyPrefixWith is not provided.
  String replaceKeyWith;
}

/// Specifies the redirect behavior of all requests to a website endpoint of an Amazon S3 bucket.
class RedirectAllRequestsTo {
  RedirectAllRequestsTo.fromXml(XmlElement xml) {
    hostName = getProp(xml, 'HostName')?.text;
    protocol = getProp(xml, 'Protocol')?.text;
  }

  /// Name of the host where requests are redirected.
  String hostName;

  /// Protocol to use when redirecting requests. The default is the protocol that is used in the original request.
  String protocol;
}

/// A container for replication rules. You can add up to 1,000 rules. The maximum size of a replication configuration is 2 MB.
class ReplicationConfiguration {
  ReplicationConfiguration.fromXml(XmlElement xml) {
    role = getProp(xml, 'Role')?.text;
    rules = ReplicationRule.fromXml(getProp(xml, 'Rules'));
  }

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that Amazon S3 assumes when replicating objects. For more information, see How to Set Up Replication in the Amazon Simple Storage Service Developer Guide.
  String role;

  /// A container for one or more replication rules. A replication configuration must have at least one rule and can contain a maximum of 1,000 rules.
  ReplicationRule rules;
}

/// Specifies which Amazon S3 objects to replicate and where to store the replicas.
class ReplicationRule {
  ReplicationRule.fromXml(XmlElement xml) {
    deleteMarkerReplication = DeleteMarkerReplication.fromXml(
        getProp(xml, 'DeleteMarkerReplication'));
    destination = Destination.fromXml(getProp(xml, 'Destination'));
    existingObjectReplication = ExistingObjectReplication.fromXml(
        getProp(xml, 'ExistingObjectReplication'));
    filter = ReplicationRuleFilter.fromXml(getProp(xml, 'Filter'));
    iD = getProp(xml, 'ID')?.text;
    prefix = getProp(xml, 'Prefix')?.text;
    priority = int.tryParse(getProp(xml, 'Priority')?.text);
    sourceSelectionCriteria = SourceSelectionCriteria.fromXml(
        getProp(xml, 'SourceSelectionCriteria'));
    status = getProp(xml, 'Status')?.text;
  }

  /// Specifies whether Amazon S3 replicates the delete markers. If you specify a Filter, you must specify this element. However, in the latest version of replication configuration (when Filter is specified), Amazon S3 doesn't replicate delete markers. Therefore, the DeleteMarkerReplication element can contain only <Status>Disabled</Status>. For an example configuration, see Basic Rule Configuration.
  DeleteMarkerReplication deleteMarkerReplication;

  /// A container for information about the replication destination and its configurations including enabling the S3 Replication Time Control (S3 RTC).
  Destination destination;

  /// Type: ExistingObjectReplication data type
  ExistingObjectReplication existingObjectReplication;

  /// A filter that identifies the subset of objects to which the replication rule applies. A Filter must specify exactly one Prefix, Tag, or an And child element.
  ReplicationRuleFilter filter;

  /// A unique identifier for the rule. The maximum value is 255 characters.
  String iD;

  ///  This member has been deprecated.
  String prefix;

  /// The priority associated with the rule. If you specify multiple rules in a replication configuration, Amazon S3 prioritizes the rules to prevent conflicts when filtering. If two or more rules identify the same object based on a specified filter, the rule with higher priority takes precedence. For example:
  int priority;

  /// A container that describes additional filters for identifying the source objects that you want to replicate. You can choose to enable or disable the replication of these objects. Currently, Amazon S3 supports only the filter that you can specify for objects created with server-side encryption using a customer master key (CMK) stored in AWS Key Management Service (SSE-KMS).
  SourceSelectionCriteria sourceSelectionCriteria;

  /// Specifies whether the rule is enabled.
  String status;
}

/// A container for specifying rule filters. The filters determine the subset of objects to which the rule applies. This element is required only if you specify more than one filter.
class ReplicationRuleAndOperator {
  ReplicationRuleAndOperator.fromXml(XmlElement xml) {
    prefix = getProp(xml, 'Prefix')?.text;
    tags = Tag.fromXml(getProp(xml, 'Tags'));
  }

  /// An object key name prefix that identifies the subset of objects to which the rule applies.
  String prefix;

  /// An array of tags containing key and value pairs.
  Tag tags;
}

/// A filter that identifies the subset of objects to which the replication rule applies. A Filter must specify exactly one Prefix, Tag, or an And child element.
class ReplicationRuleFilter {
  ReplicationRuleFilter.fromXml(XmlElement xml) {
    and = ReplicationRuleAndOperator.fromXml(getProp(xml, 'And'));
    prefix = getProp(xml, 'Prefix')?.text;
    tag = Tag.fromXml(getProp(xml, 'Tag'));
  }

  /// A container for specifying rule filters. The filters determine the subset of objects to which the rule applies. This element is required only if you specify more than one filter. For example:
  ReplicationRuleAndOperator and;

  /// An object key name prefix that identifies the subset of objects to which the rule applies.
  String prefix;

  /// A container for specifying a tag key and value.
  Tag tag;
}

///  A container specifying S3 Replication Time Control (S3 RTC) related information, including whether S3 RTC is enabled and the time when all objects and operations on objects must be replicated. Must be specified together with a Metrics block.
class ReplicationTime {
  ReplicationTime.fromXml(XmlElement xml) {
    status = getProp(xml, 'Status')?.text;
    time = ReplicationTimeValue.fromXml(getProp(xml, 'Time'));
  }

  ///  Specifies whether the replication time is enabled.
  String status;

  ///  A container specifying the time by which replication should be complete for all objects and operations on objects.
  ReplicationTimeValue time;
}

///  A container specifying the time value for S3 Replication Time Control (S3 RTC) and replication metrics EventThreshold.
class ReplicationTimeValue {
  ReplicationTimeValue.fromXml(XmlElement xml) {
    minutes = int.tryParse(getProp(xml, 'Minutes')?.text);
  }

  ///  Contains an integer specifying time in minutes.
  int minutes;
}

/// Container for Payer.
class RequestPaymentConfiguration {
  RequestPaymentConfiguration.fromXml(XmlElement xml) {
    payer = getProp(xml, 'Payer')?.text;
  }

  /// Specifies who pays for the download and request fees.
  String payer;
}

/// Container for specifying if periodic QueryProgress messages should be sent.
class RequestProgress {
  RequestProgress.fromXml(XmlElement xml) {
    enabled = getProp(xml, 'Enabled')?.text == 'TRUE';
  }

  /// Specifies whether periodic QueryProgress frames should be sent. Valid values: TRUE, FALSE. Default value: FALSE.
  bool enabled;
}

/// Container for restore job parameters.
class RestoreRequest {
  RestoreRequest.fromXml(XmlElement xml) {
    days = int.tryParse(getProp(xml, 'Days')?.text);
    description = getProp(xml, 'Description')?.text;
    glacierJobParameters =
        GlacierJobParameters.fromXml(getProp(xml, 'GlacierJobParameters'));
    outputLocation = OutputLocation.fromXml(getProp(xml, 'OutputLocation'));
    selectParameters =
        SelectParameters.fromXml(getProp(xml, 'SelectParameters'));
    tier = getProp(xml, 'Tier')?.text;
    type = getProp(xml, 'Type')?.text;
  }

  /// Lifetime of the active copy in days. Do not use with restores that specify OutputLocation.
  int days;

  /// The optional description for the job.
  String description;

  /// S3 Glacier related parameters pertaining to this job. Do not use with restores that specify OutputLocation.
  GlacierJobParameters glacierJobParameters;

  /// Describes the location where the restore job's output is stored.
  OutputLocation outputLocation;

  /// Describes the parameters for Select job types.
  SelectParameters selectParameters;

  /// S3 Glacier retrieval tier at which the restore will be processed.
  String tier;

  /// Type of restore request.
  String type;
}

/// Specifies the redirect behavior and when a redirect is applied.
class RoutingRule {
  RoutingRule.fromXml(XmlElement xml) {
    condition = Condition.fromXml(getProp(xml, 'Condition'));
    redirect = Redirect.fromXml(getProp(xml, 'Redirect'));
  }

  /// A container for describing a condition that must be met for the specified redirect to apply. For example, 1. If request is for pages in the /docs folder, redirect to the /documents folder. 2. If request results in HTTP error 4xx, redirect request to another host where you might process the error.
  Condition condition;

  /// Container for redirect information. You can redirect requests to another host, to another page, or with another protocol. In the event of an error, you can specify a different error code to return.
  Redirect redirect;
}

/// Specifies lifecycle rules for an Amazon S3 bucket. For more information, see Put Bucket Lifecycle Configuration in the Amazon Simple Storage Service API Reference. For examples, see Put Bucket Lifecycle Configuration Examples
class Rule {
  Rule.fromXml(XmlElement xml) {
    abortIncompleteMultipartUpload = AbortIncompleteMultipartUpload.fromXml(
        getProp(xml, 'AbortIncompleteMultipartUpload'));
    expiration = LifecycleExpiration.fromXml(getProp(xml, 'Expiration'));
    iD = getProp(xml, 'ID')?.text;
    noncurrentVersionExpiration = NoncurrentVersionExpiration.fromXml(
        getProp(xml, 'NoncurrentVersionExpiration'));
    noncurrentVersionTransition = NoncurrentVersionTransition.fromXml(
        getProp(xml, 'NoncurrentVersionTransition'));
    prefix = getProp(xml, 'Prefix')?.text;
    status = getProp(xml, 'Status')?.text;
    transition = Transition.fromXml(getProp(xml, 'Transition'));
  }

  /// Specifies the days since the initiation of an incomplete multipart upload that Amazon S3 will wait before permanently removing all parts of the upload. For more information, see Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Policy in the Amazon Simple Storage Service Developer Guide.
  AbortIncompleteMultipartUpload abortIncompleteMultipartUpload;

  /// Specifies the expiration for the lifecycle of the object.
  LifecycleExpiration expiration;

  /// Unique identifier for the rule. The value can't be longer than 255 characters.
  String iD;

  /// Specifies when noncurrent object versions expire. Upon expiration, Amazon S3 permanently deletes the noncurrent object versions. You set this lifecycle configuration action on a bucket that has versioning enabled (or suspended) to request that Amazon S3 delete noncurrent object versions at a specific period in the object's lifetime.
  NoncurrentVersionExpiration noncurrentVersionExpiration;

  /// Container for the transition rule that describes when noncurrent objects transition to the STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, GLACIER, or DEEP_ARCHIVE storage class. If your bucket is versioning-enabled (or versioning is suspended), you can set this action to request that Amazon S3 transition noncurrent object versions to the STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, GLACIER, or DEEP_ARCHIVE storage class at a specific period in the object's lifetime.
  NoncurrentVersionTransition noncurrentVersionTransition;

  /// Object key prefix that identifies one or more objects to which this rule applies.
  String prefix;

  /// If Enabled, the rule is currently being applied. If Disabled, the rule is not currently being applied.
  String status;

  /// Specifies when an object transitions to a specified storage class. For more information about Amazon S3 lifecycle configuration rules, see Transitioning Objects Using Amazon S3 Lifecycle in the Amazon Simple Storage Service Developer Guide.
  Transition transition;
}

/// A container for object key name prefix and suffix filtering rules.
class S3KeyFilter {
  S3KeyFilter.fromXml(XmlElement xml) {
    filterRules = FilterRule.fromXml(getProp(xml, 'FilterRules'));
  }

  /// A list of containers for the key-value pair that defines the criteria for the filter rule.
  FilterRule filterRules;
}

/// Describes an Amazon S3 location that will receive the results of the restore request.
class S3Location {
  S3Location.fromXml(XmlElement xml) {
    accessControlList = Grant.fromXml(getProp(xml, 'AccessControlList'));
    bucketName = getProp(xml, 'BucketName')?.text;
    cannedACL = getProp(xml, 'CannedACL')?.text;
    encryption = Encryption.fromXml(getProp(xml, 'Encryption'));
    prefix = getProp(xml, 'Prefix')?.text;
    storageClass = getProp(xml, 'StorageClass')?.text;
    tagging = Tagging.fromXml(getProp(xml, 'Tagging'));
    userMetadata = MetadataEntry.fromXml(getProp(xml, 'UserMetadata'));
  }

  /// A list of grants that control access to the staged results.
  Grant accessControlList;

  /// The name of the bucket where the restore results will be placed.
  String bucketName;

  /// The canned ACL to apply to the restore results.
  String cannedACL;

  /// Contains the type of server-side encryption used.
  Encryption encryption;

  /// The prefix that is prepended to the restore results for this request.
  String prefix;

  /// The class of storage used to store the restore results.
  String storageClass;

  /// The tag-set that is applied to the restore results.
  Tagging tagging;

  /// A list of metadata to store with the restore results in S3.
  MetadataEntry userMetadata;
}

/// Specifies the byte range of the object to get the records from. A record is processed when its first byte is contained by the range. This parameter is optional, but when specified, it must not be empty. See RFC 2616, Section 14.35.1 about how to specify the start and end of the range.
class ScanRange {
  ScanRange.fromXml(XmlElement xml) {
    end = int.tryParse(getProp(xml, 'End')?.text);
    start = int.tryParse(getProp(xml, 'Start')?.text);
  }

  /// Specifies the end of the byte range. This parameter is optional. Valid values: non-negative integers. The default value is one less than the size of the object being queried. If only the End parameter is supplied, it is interpreted to mean scan the last N bytes of the file. For example, <scanrange><end>50</end></scanrange> means scan the last 50 bytes.
  int end;

  /// Specifies the start of the byte range. This parameter is optional. Valid values: non-negative integers. The default value is 0. If only start is supplied, it means scan from that point to the end of the file.For example; <scanrange><start>50</start></scanrange> means scan from byte 50 until the end of the file.
  int start;
}

/// The container for selecting objects from a content event stream.
class SelectObjectContentEventStream {
  SelectObjectContentEventStream.fromXml(XmlElement xml) {
    cont = ContinuationEvent.fromXml(getProp(xml, 'Cont'));
    end = EndEvent.fromXml(getProp(xml, 'End'));
    progress = ProgressEvent.fromXml(getProp(xml, 'Progress'));
    records = RecordsEvent.fromXml(getProp(xml, 'Records'));
    stats = StatsEvent.fromXml(getProp(xml, 'Stats'));
  }

  /// The Continuation Event.
  ContinuationEvent cont;

  /// The End Event.
  EndEvent end;

  /// The Progress Event.
  ProgressEvent progress;

  /// The Records Event.
  RecordsEvent records;

  /// The Stats Event.
  StatsEvent stats;
}

/// Describes the parameters for Select job types.
class SelectParameters {
  SelectParameters.fromXml(XmlElement xml) {
    expression = getProp(xml, 'Expression')?.text;
    expressionType = getProp(xml, 'ExpressionType')?.text;
    inputSerialization =
        InputSerialization.fromXml(getProp(xml, 'InputSerialization'));
    outputSerialization =
        OutputSerialization.fromXml(getProp(xml, 'OutputSerialization'));
  }

  /// The expression that is used to query the object.
  String expression;

  /// The type of the provided expression (for example, SQL).
  String expressionType;

  /// Describes the serialization format of the object.
  InputSerialization inputSerialization;

  /// Describes how the results of the Select job are serialized.
  OutputSerialization outputSerialization;
}

/// Describes the default server-side encryption to apply to new objects in the bucket. If a PUT Object request doesn't specify any server-side encryption, this default encryption will be applied. For more information, see PUT Bucket encryption in the Amazon Simple Storage Service API Reference.
class ServerSideEncryptionByDefault {
  ServerSideEncryptionByDefault.fromXml(XmlElement xml) {
    kMSMasterKeyID = getProp(xml, 'KMSMasterKeyID')?.text;
    sSEAlgorithm = getProp(xml, 'SSEAlgorithm')?.text;
  }

  /// AWS Key Management Service (KMS) customer master key ID to use for the default encryption. This parameter is allowed if and only if SSEAlgorithm is set to aws:kms.
  String kMSMasterKeyID;

  /// Server-side encryption algorithm to use for the default encryption.
  String sSEAlgorithm;
}

/// Specifies the default server-side-encryption configuration.
class ServerSideEncryptionConfiguration {
  ServerSideEncryptionConfiguration.fromXml(XmlElement xml) {
    rules = ServerSideEncryptionRule.fromXml(getProp(xml, 'Rules'));
  }

  /// Container for information about a particular server-side encryption configuration rule.
  ServerSideEncryptionRule rules;
}

/// Specifies the default server-side encryption configuration.
class ServerSideEncryptionRule {
  ServerSideEncryptionRule.fromXml(XmlElement xml) {
    applyServerSideEncryptionByDefault = ServerSideEncryptionByDefault.fromXml(
        getProp(xml, 'ApplyServerSideEncryptionByDefault'));
  }

  /// Specifies the default server-side encryption to apply to new objects in the bucket. If a PUT Object request doesn't specify any server-side encryption, this default encryption will be applied.
  ServerSideEncryptionByDefault applyServerSideEncryptionByDefault;
}

/// A container that describes additional filters for identifying the source objects that you want to replicate. You can choose to enable or disable the replication of these objects. Currently, Amazon S3 supports only the filter that you can specify for objects created with server-side encryption using a customer master key (CMK) stored in AWS Key Management Service (SSE-KMS).
class SourceSelectionCriteria {
  SourceSelectionCriteria.fromXml(XmlElement xml) {
    sseKmsEncryptedObjects =
        SseKmsEncryptedObjects.fromXml(getProp(xml, 'SseKmsEncryptedObjects'));
  }

  ///  A container for filter information for the selection of Amazon S3 objects encrypted with AWS KMS. If you include SourceSelectionCriteria in the replication configuration, this element is required.
  SseKmsEncryptedObjects sseKmsEncryptedObjects;
}

/// Specifies the use of SSE-KMS to encrypt delivered inventory reports.
class SSEKMS {
  SSEKMS.fromXml(XmlElement xml) {
    keyId = getProp(xml, 'KeyId')?.text;
  }

  /// Specifies the ID of the AWS Key Management Service (AWS KMS) symmetric customer managed customer master key (CMK) to use for encrypting inventory reports.
  String keyId;
}

/// A container for filter information for the selection of S3 objects encrypted with AWS KMS.
class SseKmsEncryptedObjects {
  SseKmsEncryptedObjects.fromXml(XmlElement xml) {
    status = getProp(xml, 'Status')?.text;
  }

  /// Specifies whether Amazon S3 replicates objects created with server-side encryption using a customer master key (CMK) stored in AWS Key Management Service.
  String status;
}

/// Specifies the use of SSE-S3 to encrypt delivered inventory reports.
class SSES3 {
  SSES3.fromXml(XmlElement xml) {}
}

/// Container for the stats details.
class Stats {
  Stats.fromXml(XmlElement xml) {
    bytesProcessed = int.tryParse(getProp(xml, 'BytesProcessed')?.text);
    bytesReturned = int.tryParse(getProp(xml, 'BytesReturned')?.text);
    bytesScanned = int.tryParse(getProp(xml, 'BytesScanned')?.text);
  }

  /// The total number of uncompressed object bytes processed.
  int bytesProcessed;

  /// The total number of bytes of records payload data returned.
  int bytesReturned;

  /// The total number of object bytes scanned.
  int bytesScanned;
}

/// Container for the Stats Event.
class StatsEvent {
  StatsEvent.fromXml(XmlElement xml) {
    details = Stats.fromXml(getProp(xml, 'Details'));
  }

  /// The Stats event details.
  Stats details;
}

/// Specifies data related to access patterns to be collected and made available to analyze the tradeoffs between different storage classes for an Amazon S3 bucket.
class StorageClassAnalysis {
  StorageClassAnalysis.fromXml(XmlElement xml) {
    dataExport =
        StorageClassAnalysisDataExport.fromXml(getProp(xml, 'DataExport'));
  }

  /// Specifies how data related to the storage class analysis for an Amazon S3 bucket should be exported.
  StorageClassAnalysisDataExport dataExport;
}

/// Container for data related to the storage class analysis for an Amazon S3 bucket for export.
class StorageClassAnalysisDataExport {
  StorageClassAnalysisDataExport.fromXml(XmlElement xml) {
    destination =
        AnalyticsExportDestination.fromXml(getProp(xml, 'Destination'));
    outputSchemaVersion = getProp(xml, 'OutputSchemaVersion')?.text;
  }

  /// The place to store the data for an analysis.
  AnalyticsExportDestination destination;

  /// The version of the output schema to use when exporting data. Must be V_1.
  String outputSchemaVersion;
}

/// A container of a key value name pair.
class Tag {
  Tag.fromXml(XmlElement xml) {
    key = getProp(xml, 'Key')?.text;
    value = getProp(xml, 'Value')?.text;
  }

  /// Name of the tag.
  String key;

  /// Value of the tag.
  String value;
}

/// Container for TagSet elements.
class Tagging {
  Tagging.fromXml(XmlElement xml) {
    tagSet = Tag.fromXml(getProp(xml, 'TagSet'));
  }

  /// A collection for a set of tags
  Tag tagSet;
}

/// Container for granting information.
class TargetGrant {
  TargetGrant.fromXml(XmlElement xml) {
    grantee = Grantee.fromXml(getProp(xml, 'Grantee'));
    permission = getProp(xml, 'Permission')?.text;
  }

  /// Container for the person being granted permissions.
  Grantee grantee;

  /// Logging permissions assigned to the Grantee for the bucket.
  String permission;
}

/// A container for specifying the configuration for publication of messages to an Amazon Simple Notification Service (Amazon SNS) topic when Amazon S3 detects specified events.
class TopicConfiguration {
  TopicConfiguration.fromXml(XmlElement xml) {
    events = getProp(xml, 'Events')?.text;
    filter = NotificationConfigurationFilter.fromXml(getProp(xml, 'Filter'));
    id = getProp(xml, 'Id')?.text;
    topicArn = getProp(xml, 'TopicArn')?.text;
  }

  /// The Amazon S3 bucket event about which to send notifications. For more information, see Supported Event Types in the Amazon Simple Storage Service Developer Guide.
  String events;

  /// Specifies object key name filtering rules. For information about key name filtering, see Configuring Event Notifications in the Amazon Simple Storage Service Developer Guide.
  NotificationConfigurationFilter filter;

  /// An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.
  String id;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to which Amazon S3 publishes a message when it detects events of the specified type.
  String topicArn;
}

/// A container for specifying the configuration for publication of messages to an Amazon Simple Notification Service (Amazon SNS) topic when Amazon S3 detects specified events. This data type is deprecated. Use TopicConfiguration instead.
class TopicConfigurationDeprecated {
  TopicConfigurationDeprecated.fromXml(XmlElement xml) {
    event = getProp(xml, 'Event')?.text;
    events = getProp(xml, 'Events')?.text;
    id = getProp(xml, 'Id')?.text;
    topic = getProp(xml, 'Topic')?.text;
  }

  ///  This member has been deprecated.
  String event;

  /// A collection of events related to objects
  String events;

  /// An optional unique identifier for configurations in a notification configuration. If you don't provide one, Amazon S3 will assign an ID.
  String id;

  /// Amazon SNS topic to which Amazon S3 will publish a message to report the specified events for the bucket.
  String topic;
}

/// Specifies when an object transitions to a specified storage class. For more information about Amazon S3 lifecycle configuration rules, see Transitioning Objects Using Amazon S3 Lifecycle in the Amazon Simple Storage Service Developer Guide.
class Transition {
  Transition.fromXml(XmlElement xml) {
    date = DateTime.parse(getProp(xml, 'Date')?.text);
    days = int.tryParse(getProp(xml, 'Days')?.text);
    storageClass = getProp(xml, 'StorageClass')?.text;
  }

  /// Indicates when objects are transitioned to the specified storage class. The date value must be in ISO 8601 format. The time is always midnight UTC.
  DateTime date;

  /// Indicates the number of days after creation when objects are transitioned to the specified storage class. The value must be a positive integer.
  int days;

  /// The storage class to which you want the object to transition.
  String storageClass;
}

/// Describes the versioning state of an Amazon S3 bucket. For more information, see PUT Bucket versioning in the Amazon Simple Storage Service API Reference.
class VersioningConfiguration {
  VersioningConfiguration.fromXml(XmlElement xml) {
    mFADelete = getProp(xml, 'MFADelete')?.text;
    status = getProp(xml, 'Status')?.text;
  }

  /// Specifies whether MFA delete is enabled in the bucket versioning configuration. This element is only returned if the bucket has been configured with MFA delete. If the bucket has never been so configured, this element is not returned.
  String mFADelete;

  /// The versioning state of the bucket.
  String status;
}

/// Specifies website configuration parameters for an Amazon S3 bucket.
class WebsiteConfiguration {
  WebsiteConfiguration.fromXml(XmlElement xml) {
    errorDocument = ErrorDocument.fromXml(getProp(xml, 'ErrorDocument'));
    indexDocument = IndexDocument.fromXml(getProp(xml, 'IndexDocument'));
    redirectAllRequestsTo =
        RedirectAllRequestsTo.fromXml(getProp(xml, 'RedirectAllRequestsTo'));
    routingRules = RoutingRule.fromXml(getProp(xml, 'RoutingRules'));
  }

  /// The name of the error document for the website.
  ErrorDocument errorDocument;

  /// The name of the index document for the website.
  IndexDocument indexDocument;

  /// The redirect behavior for every request to this bucket's website endpoint.
  RedirectAllRequestsTo redirectAllRequestsTo;

  /// Rules that define when a redirect is applied and the redirect behavior.
  RoutingRule routingRules;
}
