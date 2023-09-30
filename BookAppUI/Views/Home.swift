//
//  Home.swift
//  BookAppUI
//
//  Created by Madhan on 28/09/2023.
//

import SwiftUI

struct Home: View {
    
    @State private var activeTag = tags.first!
    @Namespace private var animation
    
    var body: some View {
        VStack(spacing: 15){
            HStack{
                Text("Browse")
                    .font(.largeTitle.bold())
                
                Text("Recommended")
                    .fontWeight(.semibold)
                    .padding(.leading, 15)
                    .foregroundColor(.gray)
                    .offset(y: 2)
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            
            TagsView()
            
//            Books card view
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 35) {
                    ForEach(sampleBooks){
                        BooksCardView($0)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 20)
                    }
                }
            }
            .coordinateSpace(name: "scrollview")
        }
    }
    
    @ViewBuilder
    func BooksCardView(_ book: Book) -> some View{
        GeometryReader {
            let size = $0.size
            let rect = $0.frame(in: .named("scrollview"))
            
            HStack(spacing: -25) {
//                Book detail card
                VStack(alignment: .leading,spacing: 4) {
                    Text(book.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("by \(book.author)")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    RatingView(rating: book.rating)
                        .padding(.top, 10)
                     
                    Spacer(minLength: 10)
                    
                    HStack(spacing: 4){
                        Text("\(book.bookViews)")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                        
                        Text("Views")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        
                        Spacer(minLength: 10)
                        
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundStyle(.gray)
                            
                    }
                    
                }
                .padding(20)
                .frame(width: size.width / 2, height: size.height * 0.8)
                .background{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.08), radius: 8,x: 5, y: 5)
                        .shadow(color: .black.opacity(0.08), radius: 8,x: -5, y: -5)
                }
                .zIndex(1)
//                Book cover image
                ZStack{
                    Image(book.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width / 2, height: size.height)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            .frame(width: size.width)
        }
        .frame(height: 220)
    }
    
    @ViewBuilder
    func TagsView() -> some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(tags, id: \.self){ tag in
                    
                    Text(tag)
                        .font(.caption)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background{
                            if activeTag == tag{
                                Capsule()
                                    .fill(.blue)
                                    .matchedGeometryEffect(id: "activeTab", in: animation)
                            }else{
                                Capsule()
                                    .fill(.gray.opacity(0.2))
                            }
                        }
                        .foregroundStyle(activeTag == tag ? .white : .gray)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7,blendDuration: 0.7)) {
                                activeTag = tag
                            }
                        }
                }
                
            }
        }
        .padding(.horizontal, 15)
    }
}

// Sample Tags
var tags: [String] = ["History", "Classical", "Biography", "Cartoon", "Adventure"]

struct RatingView: View {
    
    var rating: Int
    var body: some View{
        HStack(spacing: 4){
            ForEach(1...5, id:\.self) { index in
                Image(systemName: "star.fill")
                    .font(.caption2)
                    .foregroundStyle(index <= rating ? .yellow : .gray.opacity(0.5))
            }
            
            Text("\(rating)")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.yellow)
                .padding(.leading, 5)
            
            
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
