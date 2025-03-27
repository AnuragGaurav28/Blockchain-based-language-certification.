module MyModule::LanguageCertification {

    use aptos_framework::signer;

    struct Certificate has key, store {
        language: vector<u8>,
    }

    /// Function to issue a language certificate to a learner.
    public fun issue_certificate(issuer: &signer, language: vector<u8>) {
        let learner = signer::address_of(issuer);
        let certificate = Certificate { language };
        move_to(issuer, certificate);
    }

    /// Function to verify if a learner has received a certificate.
    public fun verify_certificate(learner: address): bool {
        exists<Certificate>(learner)
    }
}
