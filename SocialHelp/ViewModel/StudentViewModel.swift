//
//  StudentViewModel.swift
//  SocialHelp
//
//  Created by yusuf bakır on 14.01.2024.
//

import Foundation
import RxSwift
import RxCocoa
class StudentViewModel {
    static let shared = StudentViewModel()
    
    let studentData : PublishSubject<StudentAnswer> = PublishSubject()
    let studentSignUp : PublishSubject<StudentAnswerSignin> = PublishSubject()
    let transcriptFetch : PublishSubject<Answer> = PublishSubject()
    let trancsriptGet: PublishSubject<TranskirptAnswer> = PublishSubject()
    let scholarShipe :PublishSubject<Answer> = PublishSubject()
   
    
    
    func gettStudent() {
        StudentManager.shared.getAllStudent(complete: {[weak self]data,error  in
            if let error = error {
                print(error)
            }else {
                self?.studentData.onNext(data!)
            }
    
        })
        
        
    }
    
    
    func studentSignin(student:Student) {
        let parametters: [String:Any] = [
            "email":student.email,
            "phone":student.phone,
            "password": student.password,
            "name": student.name,
            "surname": student.surname,
            "birthOfDateYear": student.birthOfDateYear,
            "identityNumber": student.identityNumber,
            "hasTranskript": student.hasTranskript,
            "scholarship": student.schorlarship]
        StudentManager.shared.StudentSignUP(parametters: parametters, student: student) { [weak self]data, error in
           
            if let error = error {
              print(error)
                
            }else {
                if let data = data {
                    self!.studentSignUp.onNext(data)
                }
            }

            
        }
       
    }
    
    func getTranscript(transcriptID:Int) {
        StudentManager.shared.transcriptDownload(id: transcriptID) { data, error in
            if let error = error {
             print(error)
            }else {
                if let data = data {
                    self.trancsriptGet.onNext(data)
                }
            }

            
        }
        
    }
    func scholarShipe(scholarshipGive :Scholarship){
        StudentManager.shared.scholarshipGive(amount: scholarshipGive.amount, statement:scholarshipGive.description, date: scholarshipGive.applicationDate, personID: scholarshipGive.person.id, stutentID: scholarshipGive.student.id, sholarShipeName: scholarshipGive.name, complete: { [weak self]data, error in
            if let error = error {
             print(error)
            }else {
                if let data = data {
                    self?.scholarShipe.onNext(data)
                }
            }

            
        })
    }
    func transcript(transcript:TranskriptModel) {
        let params :[String:Any] = [
            "student":[
                "id":transcript.id],
            "term":transcript.term,
            "transcriptPdf":transcript.trancriptPdf]
        StudentManager.shared.transcriptLoading(parametters: params, complete: {[weak self]data, error in
            if let error = error {
             print(error)
            }else {
                if let data = data {
                    self?.transcriptFetch.onNext(data)
                }
            }

            
            
            
            
            
        })
    }
    func getStudunetAll() {
        StudentManager.shared.getAllStudent(complete: {[weak self]data, error in
            
            if let error = error {
             print(error)
            }else {
                if let data = data {
                    self?.studentData.onNext(data)
                }
            }

            
            
        })
    }
    
}

