//
//  DestinationSearchView.swift
//  AirbnbTutorial
//
//  Created by Johanan Edmeade on 11/16/23.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case date
    case guest
}

struct DestinationSearchView: View {
    
    @State private var selectionOption: DestinationSearchOptions = .location
    
    //changes state of boolean on explore page.
    @Binding var show: Bool
    @StateObject var viewModel: ExploreViewModel
    //user input for textField
    
    //start and end date
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    @State private var numGuest = 0
    
    var body: some View {
        
        VStack{
            //Close button
            HStack {
                Button{
                    //action tied to boolean
                    withAnimation(.easeInOut){
                        viewModel.filterUserSearch()
                        show.toggle()
                    }
                }label: {
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(.gray)
                        .imageScale(.large)
                    }
                Spacer()
                
                //if textbox isnt empty, show clear feature
                if !viewModel.searchDestination.isEmpty{
                    Button("Clear"){
                        //clear text
                        viewModel.searchDestination = ""
                        viewModel.filterUserSearch()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                     }
                }
                
            .padding()
        //expandable/collapsable components
            //where to
            VStack(alignment: .leading){
                //if expanded: show this information else collapse
                if selectionOption == .location{
                    Text("Where to")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                        
                        TextField("Set Destination", text: $viewModel.searchDestination)
                            .font(.headline)
                            .onSubmit {
                                viewModel.filterUserSearch()
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    }
                }else{
                    CollapsedViews(title: "Where", description: "Add Destination")
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectionOption == .location ? 120 : 80)
            .onTapGesture {
                withAnimation(.snappy){
                    selectionOption = .location
                }
            }
            
            //date module
            VStack(alignment: .leading){
                if selectionOption == .date{
                    Text("When's your trip")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack(alignment: .leading){
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                        
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }else{
                    CollapsedViews(title: "When", description: "Add Dates")
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectionOption == .date ? 180 : 80)
            .onTapGesture {
                withAnimation(.snappy){
                    selectionOption = .date
                }
            }
            
            //guest num view
            VStack{
                if selectionOption == .guest{
                    Text("Whose's coming")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack(alignment: .leading){
                        Stepper{
                             Text("\(numGuest) Guest")
                        }onIncrement: {
                            numGuest += 1
                        }onDecrement: {
                            guard numGuest > 0 else{return}
                            numGuest -= 1
                        }
                        
                    }
                }else{
                    CollapsedViews(title: "Who", description: "Add Guest")
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectionOption == .guest ? 120 : 60)
            .onTapGesture {
                withAnimation(.snappy){
                    selectionOption = .guest
                }
            }
        }
       Spacer()
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}

//custom modifier
struct CollapsableDestinationViewModifier: ViewModifier {
    func body(content:Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}
//code for view dates and guest
struct CollapsedViews: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
                    .fontWeight(.semibold)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
//        .padding()
//        .background(.white)
//        .clipShape(RoundedRectangle(cornerRadius: 12))
//        .padding()
//        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}
