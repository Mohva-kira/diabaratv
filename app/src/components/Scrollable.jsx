import React, { useState, useEffect } from "react";
import InfiniteScroll from "react-infinite-scroll-component";
import {Loader} from "../components";

const Scrollable = ({children, data}) => {
  return (
    <InfiniteScroll
    dataLength={data?.length}
    next={"fetchMoreData"}
    hasMore={false}
    loader={<Loader />}
    endMessage={
        <p className="text-white text-body font-semibold text-center">
          <b>Vous avez tout vue ici !!!!</b>
        </p>
      }
      // below props only if you need pull down functionality
    //   refreshFunction={"this.refresh"}
    //   pullDownToRefresh
      pullDownToRefreshThreshold={50}
      pullDownToRefreshContent={
        <h3 style={{ textAlign: 'center' }}>&#8595; Pull down to refresh</h3>
      }
      releaseToRefreshContent={
        <h3 style={{ textAlign: 'center' }}>&#8593; Release to refresh</h3>
      }
  >
    <div>

        {children}
    </div>

    </InfiniteScroll>
  )
}

export default Scrollable