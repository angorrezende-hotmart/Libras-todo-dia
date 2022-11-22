//
//  UIImageViewExtension.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 20/10/21.
//

public extension UIImageView {
    func fetchImage(
        with urlString: String,
        placeholder: UIImage? = .none,
        imageFetcher: CosmosImageFetcher,
        requestBuilder: CosmosMediaRequestBuilding? = .none,
        forceRefreshImage: Bool = false,
        progressImageBlock: CosmosImageFetcherProgressBlock? = .none,
        completion: CosmosImageFetcherCompletionBlock? = .none
    ) {
        imageFetcher.fetchImage(
            with: urlString,
            placeholder: placeholder,
            imageView: self,
            requestBuilder: requestBuilder,
            forceRefreshImage: forceRefreshImage,
            progressImageBlock: progressImageBlock,
            completion: completion
        )
    }
}
