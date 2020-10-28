@IsTest
private class ExternalToDoMetadataManagerTest {
    public static final String TODOS_URL = 'https://epam2-dev-ed.my.salesforce.com/services/apexrest/todos';
    public static final String SUB_TODOS_URL = 'https://epam2-dev-ed.my.salesforce.com/services/apexrest/subtodos';
    public static final String OAUTH_URL = 'https://epam2-dev-ed.my.salesforce.com/services/oauth2/token';


    @IsTest
    static void getOauthUrlShouldReturnUrl() {
        String result;
        Test.startTest();
        result = ExternalToDoMetadataManager.getOauthUrl();
        Test.stopTest();
        System.assertEquals(OAUTH_URL, result);
    }

    @IsTest
    static void getURLShouldReturnCorrectUrl() {
        String result;
        Test.startTest();
        result = ExternalToDoMetadataManager.geToDoURL();
        Test.stopTest();
        System.assertEquals(TODOS_URL, result);
    }

    @IsTest(SeeAllData = true)
    static void getCredentialsShouldReturnCredentialsDto(){
        Second_Org_Credentials__mdt credentials = [
                SELECT Client_Id__c, Client_Secret__c, Username__c, Password__c
                FROM Second_Org_Credentials__mdt
                WHERE MasterLabel = :ExternalToDoMetadataManager.CREDENTIALS_METADATA_LABEL
        ];
        CredentialsDto credentialsDto = new CredentialsDto();
        credentialsDto.username = credentials.Username__c;
        credentialsDto.password = credentials.Password__c;
        credentialsDto.clientId = credentials.Client_Id__c;
        credentialsDto.clientSecret = credentials.Client_Secret__c;

        Test.startTest();
        CredentialsDto result = ExternalToDoMetadataManager.getCredentials();
        Test.stopTest();
        System.assertEquals(credentialsDto.username, result.username);
        System.assertEquals(credentialsDto.password, result.password);
        System.assertEquals(credentialsDto.clientSecret, result.clientSecret);
        System.assertEquals(credentialsDto.clientId, result.clientId);
    }

    @IsTest
    static void getSubToDoURLShouldReturnURL(){
        Test.startTest();
        String result = ExternalToDoMetadataManager.getSubToDoURL();
        Test.stopTest();
        System.assertEquals(SUB_TODOS_URL, result);
    }
}