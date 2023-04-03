//
//  PullToRefresh.swift
//  mise-foodtracker
//
//  Created by Radu Bila on 10/23/22.
//

import SwiftUI


struct PullToRefresh: View {
    // MARK: - PROPERTIES
    var coordinateSpaceName: String
    var onRefresh: ()->Void
    
    @State var needRefresh: Bool = false
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geo in
            if (geo.frame(in: .named(coordinateSpaceName)).midY > 50) {
                Spacer()
                    .onAppear {
                        needRefresh = true
                    }
            } else if (geo.frame(in: .named(coordinateSpaceName)).maxY < 10) {
                Spacer()
                    .onAppear {
                        if needRefresh {
                            needRefresh = false
                            onRefresh()
                        }
                    }
            }
            
            HStack {
                Spacer()
                if needRefresh {
                    ProgressView()
                } else {
                    ProgressView()
                }
                Spacer()
            }
        }
        .padding(.top, -50)
    }
}

// MARK: - PREVIEW
struct PullToRefresh_Previews: PreviewProvider {
    static var previews: some View {
        ForumView()
    }
}
