//
//  SwipeToDoAction.swift
//  SwipeToDoAction
//
//  Created by Lai Hong Yu on 10/10/24.
//

import SwiftUI

@available(iOS 16.0, *)
public struct SwipeToDoAction: View {
    @State private var offset: CGFloat = 0
    @Binding var isSwiped: Bool
    var swipeText: String
    var swipeColor: Color
    var onSwipe: () -> Void
    public init(isSwiped: Binding<Bool>, onSwipe: @escaping () -> Void, swipeText: String = "Slide to Delete", swipeColor: Color = .red) {
           self._isSwiped = isSwiped
        self.onSwipe = onSwipe
           self.swipeText = swipeText
           self.swipeColor = swipeColor
    }
    public var body: some View {
        ZStack {
            // Background
            RoundedRectangle(cornerRadius: 30)
                .fill(swipeColor)
                .frame(height: 60)

            // Text on the button
            Text(swipeText)
                .foregroundColor(.white)
                .font(.headline)
                .padding(.leading, 50)
                .frame(maxWidth: .infinity, alignment: .center)

            // Sliding arrow button
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 50, height: 50)
                        .scaleEffect(offset > 0 ? 1.1 : 1.0)
                        .animation(.easeInOut, value: offset)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                }
                .offset(x: offset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            let maxWidth = UIScreen.main.bounds.width - 40
                            let maxOffset = maxWidth - 60
                            let newOffset = min(gesture.translation.width, maxOffset)
                            self.offset = newOffset
                        }
                        .onEnded { gesture in
                            if gesture.translation.width > 200 {
                                // Action when fully slid
                                withAnimation {
                                    isSwiped = true
                                    self.offset = 0
                                    onSwipe()
                                }
                            } else {
                               
                                withAnimation {
                                    self.offset = 0
                                }
                            }
                        }
                )
                Spacer()
            }
            .padding(.leading, 10)
        }
        .padding(.horizontal, 20)
    }
}
