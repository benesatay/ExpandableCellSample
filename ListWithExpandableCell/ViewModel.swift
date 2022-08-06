//
//  ViewModel.swift
//  ListWithExpandableCell
//
//  Created by Bahadır Enes Atay on 6.08.2022.
//

import Foundation

struct ListViewModel {
   static var list: [ViewModel] {
        var list: [ViewModel] = [ViewModel]()
        for index in 0..<DataManager.questionArray.count {
            let item = ViewModel(question: DataManager.questionArray[index], answer: DataManager.answerArray[index], isExpanded: false)
            list.append(item)
        }
        return list
    }
}

struct ViewModel {
    var question: String?
    var answer: String?
    var isExpanded: Bool = false
  
}

struct DataManager {
    static let questionArray = ["What is ParaGönder?","How does ParaGönder work?","How can I send money to Turkey via ParaGönder?","To which countries can I send money with ParaGönder?","To whom can I send money with ParaGönder?","Why should I increase my limit?","Can I request a higher limit?","Do I need to have an account with İŞBANK to use ParaGönder?","From which banks can money transfers be made?","When will my money reach the recipient?","Is it safe to transfer money with ParaGönder?","What currency options do I have when transferring money?","How do I donate to charities in Turkey with ParaGönder?"]
    static let answerArray = ["ParaGönder is a mobile app that allows you to send money conveniently and securely. It is possible to send money from banks in Germany and Austria to any bank in Turkey and Kosovo without going to a branch. You can transfer money to an IBAN as well as to a recipient name for direct cash pickup from a İŞBANK branch.","ParaGönder uses the well-established infrastructure of Turkey's largest private bank İŞBANK. This enables the possibility for Turkey transfers from all banks in Germany and Austria to any bank in Turkey and to Kosovo.","Download the ParaGönder app on your smartphone and register. Add the bank account from which you want to make the transfers. The first and last name of the added account must match the ParaGönder user information. Enter the information required for the legitimation process. You are ready to send money. From your registered accounts on ParaGönder, select the account you want to make a transaction with. Enter the IBAN of the person you want to send money to. If the person does not have a bank account, you can enter the name, amount and İŞBANK branch name. This information will be checked during the cash collection. Now please confirm all the information. Send your money successfully from anywhere and at any time.","Currently, the money can be sent to Turkey and Kosovo.","You can send money to TL accounts of any Turkish bank or to Euro and TL accounts of İŞBANK Turkey. Euro transactions to Kosovo can be made to any bank. If the recipient does not have a bank account, the money can be sent to Kosovo and Turkey branches of İŞBANK of your choice directly to the recipient's name.","You can increase your limit in order to transfer more money. Your existing limit of 999 EUR will be increased to 10,000 EUR per single transfer and 50,000 EUR per month for transfers from Germany after the limit increase. For transfers from Austria, your limit will be increased to 5,000 EUR per single transfer and 25,000 EUR per month.","You have the possibility, after successful legitimation via video identification within the ParaGönder app or the legitimation in the branches of İŞBANK, to transfer up to 10,000 EUR with a single transfer and monthly payments up to 50,000 EUR from Germany. For transfers from Austria, you can transfer 5,000 EUR per single transfer and 25,000 EUR per month after a limit increase.","No, there is no such necessity. With ParaGönder you can also transfer money from other banks in Germany and Austria.","Transfers can be made from almost all banks in Germany and Austria.","Transfers made with ParaGönder are executed in a maximum of 2 business days.","İŞBANK's infrastructure has been in operation for many years. Your data is safe with ParaGönder and no data is collected without your consent.","For Turkey transfers you can send Euro or TL. For Kosovo transfers you can only send Euro.","You can donate the desired amount to the institution you have selected in the ParaGönder donation menu without having to pay a fee."]
}
