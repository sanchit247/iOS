//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by mohit on 02/07/19.
//  Copyright © 2019 com.sanchit. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var employees : [Employee] = [Employee(id: 0, name: "sanchit", title: "Owner"),
                                  Employee(id: 1, name: "Ajay", title: "Digital Artist"),
                                  Employee(id: 2, name: "Ray", title: "CTO"),
                                  Employee(id: 3, name: "sam", title: "Sales"),
                                  Employee(id: 4, name: "Kate", title: "Marketing"),
                                  Employee(id: 5, name: "Matt", title: "Accounts")
                                ]
    var body: some View {
            NavigationView{
                ScrollView{
                    // Table View code here
                    EmployeeTableViewCell(employees: employees)
                        .navigationBarItems(leading: Button(action: {
                            print("Left bar Item Clicked")
                        }, label: {
                            Text("Left Btn")
                        }), trailing: Button(action:{
                            print("Right Bar Item Clicked")
                        },label: {
                            Text("Right Btn")
                        }))
                        .navigationBarItem(title: Text("Screen"), titleDisplayMode: .inline, hidesBackButton: true)
                        .frame(width : UIScreen.main.bounds.width,height:300)
                    // Label code here
                    LabelContent()
                    // Image code here
                    ImageView()
                }
            }
    }
}
struct EmployeeTableViewCell : View{
    var employees : [Employee]
    var body: some View {
        List(employees) {employee in
            VStack(alignment : .leading){
                    Text(employee.name)
                    Text(employee.title)
                }
            }
    }
}
struct LabelContent : View{
    var body : some View {
        VStack{
            Text("Label Here")
                .frame(width: UIScreen.main.bounds.width,height:80)
                .background(Color.red)
        }
    }
}
struct ImageView : View{
    var body : some View{
        Image("coffee").resizable()
        .frame(width: 400, height: 600,alignment: .top)
        .background(Color.green)
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView{
             ContentView(employees: testData)
        }
    }
}
#endif
