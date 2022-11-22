//
//  ImageDownloaderProtocols.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 20/10/21.
//

// MARK: - Protocols

public protocol CosmosMediaRequestBuilding {
    /// Used to encapsulate any authorization header's that is needed do download a image
    /// - Parameter url: The image url
    func buildImageRequest(for url: String) -> URLRequest
}

/**
 Cache type of a cached image.

 - None:   The image is not cached yet when retrieving it.
 - Memory: The image is cached in memory.
 - Disk:   The image is cached in disk.
 */
public enum CosmosImageCacheType {
    case memory, disk, none
}

public typealias CosmosImageFetcherProgressBlock = (_ receivedSize: Int64, _ totalSize: Int64) -> Void
public typealias CosmosImageFetcherCompletionBlock = (_ image: UIImage?, _ error: Error?, _ cacheType: CosmosImageCacheType, _ imageURL: URL?) -> Void

public protocol CosmosImageFetcher {
    func fetchImage(with urlString: String, placeholder: UIImage?, imageView: UIImageView, requestBuilder: CosmosMediaRequestBuilding?, forceRefreshImage: Bool, progressImageBlock: CosmosImageFetcherProgressBlock?, completion: CosmosImageFetcherCompletionBlock?)

    func cancelFetch(in imageView: UIImageView)
}
