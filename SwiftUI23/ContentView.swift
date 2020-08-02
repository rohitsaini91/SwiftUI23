//
//  ContentView.swift
//  SwiftUI23
//
//  Created by Rohit Saini on 02/08/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var currentPage = 0
    var body: some View {
        VStack{
            ZStack{
                if currentPage == 0{
                     Image("page1").resizable().frame(height: 400).cornerRadius(20).padding()
                }
                else if currentPage == 1{
                     Image("page2").resizable().frame(height: 400).cornerRadius(20).padding()
                }
                else{
                   Image("page3").resizable().frame(height: 400).cornerRadius(20).padding()
                }
            }
            PageControlView(current: currentPage)
            HStack{
                Button(action: {
                    if self.currentPage != 0 {
                        self.currentPage = self.currentPage - 1
                    }
                }) {
                    Text("Previous").fontWeight(.heavy).padding()
                }
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
                Button(action: {
                    if self.currentPage < 3{
                        self.currentPage = self.currentPage + 1
                    }
                }) {
                    Text("Next").fontWeight(.heavy).padding()
                }
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }.animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PageControlView:UIViewRepresentable{
    var current = 0
    func makeUIView(context: UIViewRepresentableContext<PageControlView>) -> UIPageControl {
        let page = UIPageControl()
        page.currentPageIndicatorTintColor = .black
        page.numberOfPages = 3
        page.pageIndicatorTintColor = .gray
        return page
    }
    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<PageControlView>) {
        uiView.currentPage = current
    }
}
