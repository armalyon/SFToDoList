
public with sharing class ExternalToDoMetadataManager {
    public static final String URL_METADATA_LABEL = 'V1 URLs';
    public static final String CREDENTIALS_METADATA_LABEL = 'V1';


    public static String getOauthUrl() {
        return [
                SELECT Oauth_URL__c
                FROM Second_Org_URLs__mdt
                WHERE MasterLabel = :URL_METADATA_LABEL
        ].Oauth_URL__c;
    }

    public static String geToDoURL() {
        return [
                SELECT ToDos_URL__c
                FROM Second_Org_URLs__mdt
                WHERE MasterLabel = :URL_METADATA_LABEL
        ].ToDos_URL__c;
    }

    public static CredentialsDto getCredentials() {
        Second_Org_Credentials__mdt credentials = [
                SELECT Client_Id__c, Client_Secret__c, Username__c, Password__c
                FROM Second_Org_Credentials__mdt
                WHERE MasterLabel = :CREDENTIALS_METADATA_LABEL
        ];
        CredentialsDto credentialsDto = new CredentialsDto();
        credentialsDto.username = credentials.Username__c;
        credentialsDto.password = credentials.Password__c;
        credentialsDto.clientId = credentials.Client_Id__c;
        credentialsDto.clientSecret = credentials.Client_Secret__c;

        return credentialsDto;
    }

    public static String getSubToDoURL(){
        return [
                SELECT SubToDos_URL__c
                FROM Second_Org_URLs__mdt
                WHERE MasterLabel = :URL_METADATA_LABEL
        ].SubToDos_URL__c;
    }

}