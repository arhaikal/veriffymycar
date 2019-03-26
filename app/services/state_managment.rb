class StateManagment
   def initialize(user)
     @user = user
   end 

   def check_state
     if verified_document
       return :verified
     else 
       return :unverified
     end
   end
  
   private 

   def verified_document
     VerificationSession.find_by(
       'document_id IN (?) AND status = ?',
        valid_documents_ids, VerificationSession::VERIFIED
        )
   end    

   def valid_documents_ids
     documents = @user.documents.
      where('valid_from < ? AND valid_until > ?', Date.today, Date.today)

     documents.map { |document| document.id }
   end 
end