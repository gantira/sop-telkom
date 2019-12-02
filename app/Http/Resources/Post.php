<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Tag as TagResource;
use App\Http\Resources\Comment as CommentResource;
use App\Http\Resources\User as UserResource;

class Post extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'body' => $this->body,
            'publish' => $this->publish,
            'slug' => $this->slug,
            'user' => new UserResource($this->user),
            'comments' => CommentResource::collection($this->comments),
            'view' => $this->view->count ?? 0,
            'tags' => TagResource::collection($this->tags),
            'created_at' => $this->created_at->diffForHumans(),
            'updated_at' => $this->updated_at->format('d/m/Y'),
        ];
    }
}
