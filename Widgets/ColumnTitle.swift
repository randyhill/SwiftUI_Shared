//
//  ColumnTitle.swift
//  Ike
//
//  Created by Randy Hill on 12/4/20.
//

import SwiftUI

struct ColumnTitle: View {
	let title: String
    @ObservedObject private var settings = AppSettings()

	var body: some View {
		Text(title)
			.padding(2)
			.frame(maxWidth: .infinity, minHeight: 30,  alignment: .center)
            .background(settings.color.title.color)
            .clipShape(RoundedRectangle(cornerRadius: 8))
	}
}

struct ColumnTitle_Previews: PreviewProvider {
    static var previews: some View {
		ColumnTitle(title: "Column Title")
    }
}
