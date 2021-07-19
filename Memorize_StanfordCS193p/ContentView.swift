//
//  ContentView.swift
//  Memorize_StanfordCS193p
//
//  Created by Александр Тимофеев on 05.07.2021.
//

import SwiftUI

struct ContentView: View {
  
  var vehicleEmojis = ["🚗", "🚙", "🚌", "🚒", "🚐", "🚚", "🚜", "🛴", "🚂", "🚆", "🚁", "🛩"]
  var animalEmojis = ["🐶","🐗","🐒","🐙","🐢","🐬","🐼","🦁","🦇","🐺","🦩", "🐳", "🦨", "🦦", "🦥", "🐁"]
  var plantEmojis = ["🌳", "🌼", "🌸", "🥀", "🌹", "🍁", "🌵", "💐", "🌻", "🌿", "🌺", "🎍", "🌾", "🎄"]
  
  
  @State var emojis = [""]
  
  
  var body: some View {
    VStack {
      Text("Memorise!")
        .font(.largeTitle)
      ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
          ForEach(emojis[0..<emojis.count], id: \.self) { emoji in
            CardView(content: emoji)
              .aspectRatio(2/3, contentMode: .fit)
          }
        }
      }
      .font(.largeTitle)
      .foregroundColor(.red)
      Spacer(minLength: 20)
      HStack {
        VStack {
          Text("Vehicle")
          vehicleThemeButton
            .font(.largeTitle)
        }
        Spacer()
        VStack {
          Text("Animals")
          animalsThemeButton
            .font(.largeTitle)
        }
        Spacer()
        VStack {
          Text("Plants")
          plantsThemeButton
            .font(.largeTitle)
        }
      }
      .padding(.horizontal)
    }
    .padding()
  }
  
  var vehicleThemeButton: some View {
    Button {
      emojis.removeAll()
      emojis = vehicleEmojis.shuffled()
    } label: {
      Image(systemName: "car.fill")
    }
  }
  
  var animalsThemeButton: some View {
    Button {
      emojis.removeAll()
      emojis = animalEmojis.shuffled()
    } label: {
      Image(systemName: "tortoise.fill")
    }
  }
  
  var plantsThemeButton: some View {
    Button {
      emojis.removeAll()
      emojis = plantEmojis.shuffled()
    } label: {
      Image(systemName: "leaf.fill")
    }
  }
}


struct CardView: View {
  var content: String
  @State var isFaceUp: Bool = true
  
  var body: some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: 10.0)
      if isFaceUp {
        shape.fill(Color.white)
        shape.strokeBorder(lineWidth: 5)
        Text(content).font(.largeTitle)
      } else {
        shape.fill()
      }
    }
    .onTapGesture {
      isFaceUp = !isFaceUp
    }
  }
}




struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
