//
//  LaunchCell.swift
//  GraphQL
//
//  Created by Pallab Maiti on 16/03/21.
//

import SwiftUI
import Apollo

struct LaunchCell: View {
    var launch: LaunchFragment?
    var body: some View {
        VStack(alignment: .leading) {
            Text(launch?.missionName ?? "ABC")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .font(.title)
            Text(launch?.launchSite?.siteNameLong ?? "ABC")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .font(.subheadline)
        }
        .padding(.horizontal, 10)
    }
}

struct LaunchCell_Previews: PreviewProvider {
    static var previews: some View {
        LaunchCell()
            .previewLayout(.fixed(width: 375, height: 60))
    }
}
