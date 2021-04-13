//
//  ContextView.swift
//  Ike
//
//  Created by Randy Hill on 11/27/20.
//

import SwiftUI

struct TagsView: View {
	var task: Task
	
    var body: some View {
		guard task.tags.count > 0 else {
			return AnyView(EmptyView())
		}
		return AnyView(
			HStack(alignment: .center) {
				Text("Tags:")
					.font(.body)
					.foregroundColor(Color.white)
				ForEach(task.tags, id: \.self) { context in
					VStack(alignment: .center) {
						Text("\(context.name)")
							.font(.footnote)
							.foregroundColor(Color.coolBlack)
							.padding(2.0)
							.background(Color.coolOrange)
							.cornerRadius(4.0)
					}
				}
			}
		)
    }
}

struct ContextView_Previews: PreviewProvider {
    static var previews: some View {
		TagsView(task: Task.testData).background(Color.maroon)
    }
}
