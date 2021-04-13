//
//  RowTitle.swift
//  Ike
//
//  Created by Randy Hill on 12/4/20.
//

import SwiftUI

struct RowTitle: View {
	let title: String
    @ObservedObject var settings = AppSettings()

	var body: some View
	{
		Text(title)
			.rotationEffect(.degrees(-90))
			.fixedSize()
            .frame(minWidth: 20, maxWidth: 24, maxHeight: .infinity, alignment: .center)
            .background(settings.color.title.color)
            .clipShape(RoundedRectangle(cornerRadius: 8))
	}
}

struct RowTitle_Previews: PreviewProvider {
    static var previews: some View {
        RowTitle(title: "Row Title")
    }
}
